<h1>AI Series HOL</h1>
<h1>Challenge 3 – Face Registration, Verification & Audit Log</h1>
<p>In Challenge 3, we are going to explore Azure Face Resister API, Azure Face Verify API and audit log of the whole application</p>
<h2>Getting Started</h2>
<h3>Prerequisites</h3>
<li>Kindly ensure that the application works fine so far.</li>
<li>We are going to build the Register, Verify and Audit Log modules in the same application</li>
<h3>Code Summary</h3>
<p></p>
<ol>
  <strong>
      <li>To start with, update the API Key and Endpoint in Web.Config</li>
      <li>Grab the Key and Endpoint from 'Hero Solutions' site</li>
      <li>Open Web.Config file</li>&nbsp;
      <img src="http://139.59.61.161/MSWorkshop2019/Class/Web_config.PNG" alt="image" style="max-width:100%;">&nbsp;
      <li>Enter the values for 'FaceIDSubscriptionKey', 'FaceIDEndpoint' and 'PersonGroupId'.</li>&nbsp;
      <img src="http://139.59.61.161/MSWorkshop2019/Register/register_WebConfig.PNG" alt="image" style="max-width:100%;">
  </strong>
</ol>
<h3>Design Changes</h3>
<p>Lets start to uncomment code in design screens</p>
<p>Follow the screenshot shown below to navigate to the register.cshtml file</p>
<ol>
<strong>
   <li>Open register.cshtml</li>&nbsp;
   <img src="http://139.59.61.161/MSWorkshop2019/Register/UnComment1.PNG" style="max-width:100%;">&nbsp;
   <li>Select the code from line number 121 to 123 and click on the uncomment button</li>&nbsp;
   <img src="http://139.59.61.161/MSWorkshop2019/Register/UnComment2.png" style="max-width:100%;">
</strong>
</ol>
<h2>Invoking the Register API</h2>
<<h3>Getting Started with the coding part - Following are the guidelines to work on the Register API</h3>
<p>explain code</p>
<ol>
	<strong>
		<li>Paste the code given below in 'FaceRegistrationHandler.cs', (i.e) below the comment 'Paste the 'FaceRegistrationHandler' Class code here...'</li>
		<blockquote>
			<pre>
				<code>
public class FaceRegistrationHandler
{
    public string error = "";
    //Assigning Subscription Key and Face Endpoint from web.config file
    private string subscriptionKey = ConfigurationManager.AppSettings["FaceIDSubscriptionKey"], FaceIDEndpoint = ConfigurationManager.AppSettings["FaceIDEndpoint"], PersonGroupId = ConfigurationManager.AppSettings["PersonGroupId"];
&nbsp;
    public string RegisterFace(byte[] imageBytes, string name)
    {
        try
        {
            string PersonId = GetPersonId(name);
            if (PersonId == "")
                return "";
            else
            {
                string PersistedFace = AddFace(imageBytes, PersonId);
                if (PersistedFace == "")
                    return "";
                else
                    if (TrainPersonGroup())
                    return PersonId;
                return "";
            }
        }
        catch (Exception e)
        {
            error = e.Message;
            return "";
        }
    }
&nbsp;
    public string VerifyFace(byte[] imageBytes,bool CheckIn)
    {
        try
        {
            string faceid = DetectFace(imageBytes);
            if (faceid == "")
                return "Face Not Found";
            else
            {
                string personid = IdentifyFace(faceid);
                if (personid == "")
                    return "Unauthorized Person";
                else
                {
                    DateTime dt = DateTime.Now;
                    string date = dt.ToString("dd/MM/yyyy"); // Will give you smth like 25/05/2011
                    string time = dt.ToString("hh:mm tt"); //Output: 11:00 PM
                    VerifyTimeTable vtt = new VerifyTimeTable();
                    string name = GetPersonInfo(personid);
                    if (CheckIn)
                    {
                         if (vtt.CheckIn(personid, date, time))
                            return "Welcome " + name + ", You Checked-In at " + time;
                        else
                            return "Sorry " + name + ", You are Already Checked-In";
                    }
                    else
                    {
                        if (vtt.CheckOut(personid, date, time))
                            return "Good Bye " + name + ", You Checked-Out at " + time;
                        else
                            return "Please Check-In " + name;
                    }
                }
            }
&nbsp;
        }
        catch (Exception e)
        {
            error = e.Message;
            return "";
        }
    }
&nbsp;
    private string GetPersonId(string Name)
    {
        var client = new RestClient(FaceIDEndpoint + "/face/v1.0/persongroups/" + PersonGroupId + "/persons");
        var request = new RestRequest(Method.POST);
&nbsp;
        request.AddHeader("ocp-apim-subscription-key", subscriptionKey);
        request.AddHeader("content-type", "application/json");
        request.AddParameter("application/json", "{\r\n    \"name\": \"" + Name + "\"\r\n}", ParameterType.RequestBody);
&nbsp;
        IRestResponse response = client.Execute(request);
        dynamic PersonData = JObject.Parse(response.Content);
&nbsp;
        foreach (JProperty prop in PersonData.Properties())
            if (prop.Name == "error")
                return "";
        return PersonData.personId;
    }
&nbsp;
    private string AddFace(byte[] imageBytes, string PersonID)
    {
        var client = new RestClient(FaceIDEndpoint + "/face/v1.0/persongroups/" + PersonGroupId + "/persons/" + PersonID + "/persistedFaces");
        var request = new RestRequest(Method.POST);
&nbsp;
        request.AddHeader("ocp-apim-subscription-key", subscriptionKey);
        request.AddHeader("content-type", "application/octet-stream");
        request.AddParameter("undefined", imageBytes, ParameterType.RequestBody);
&nbsp;
        IRestResponse response = client.Execute(request);
&nbsp;
        dynamic FaceData = JObject.Parse(response.Content);
&nbsp;
        foreach (JProperty prop in FaceData.Properties())
            if (prop.Name == "error")
                return "";
&nbsp;
        return FaceData.persistedFaceId;
    }
&nbsp;
    private bool TrainPersonGroup()
    {
        var client = new RestClient(FaceIDEndpoint + "/face/v1.0/persongroups/" + PersonGroupId + "/train");
        var request = new RestRequest(Method.POST);
&nbsp;
        request.AddHeader("ocp-apim-subscription-key", subscriptionKey);
        request.AddHeader("content-type", "application/json");
&nbsp;
        IRestResponse response = client.Execute(request);
        if (response.Content.Length == 0)
            return true;
        else
            return false;
    }
&nbsp;
    private string DetectFace(byte[] imageBytes)
    {
        try
        {
&nbsp;
            var client = new RestClient(FaceIDEndpoint + "/face/v1.0/detect?returnFaceId=true&returnFaceLandmarks=false&recognitionModel=recognition_01&returnRecognitionModel=false");
            var request = new RestRequest(Method.POST);
&nbsp;
            request.AddParameter("undefined", imageBytes, ParameterType.RequestBody);
            request.AddHeader("ocp-apim-subscription-key", subscriptionKey);
            request.AddHeader("content-type", "application/octet-stream");
&nbsp;
            IRestResponse response = client.Execute(request);
            JArray PersonArray = JArray.Parse(response.Content);
&nbsp;
            string faceId = "";
            for (int i = 0; i < PersonArray.Count; i++)
            {
                dynamic PersonData = JObject.Parse(PersonArray[i].ToString());
                faceId = PersonData.faceId;
                i = PersonArray.Count;
            }
            return faceId;
        }
        catch (Exception)
        {
            return "";
        }
    }
&nbsp;
    private string IdentifyFace(string FaceID)
    {
        try
        {
            var client = new RestClient(FaceIDEndpoint + "/face/v1.0/identify");
            var request = new RestRequest(Method.POST);
&nbsp;
            request.AddHeader("ocp-apim-subscription-key", subscriptionKey);
            request.AddHeader("content-type", "application/json");
            request.AddParameter("application/json", "{\r\n    \"personGroupId\": \"" + PersonGroupId + "\",\r\n    \"faceIds\": [\r\n        \"" + FaceID + "\"\r\n    ],\r\n    \"maxNumOfCandidatesReturned\": 1,\r\n    \"confidenceThreshold\": 0.5\r\n}", ParameterType.RequestBody);
&nbsp;
            IRestResponse response = client.Execute(request);
            JArray ResponseArray = JArray.Parse(response.Content);
&nbsp;
            string personid = "";
            for (int i = 0; i < ResponseArray.Count; i++)
            {
                dynamic PersonData = JObject.Parse(ResponseArray[i].ToString());
                JArray PersonArray = JArray.Parse(PersonData.candidates.ToString());
                for (int j = 0; j < PersonArray.Count; j++)
                {
                    dynamic Person = JObject.Parse(PersonArray[j].ToString());
                    personid = Person.personId;
                    j = PersonArray.Count;
                }
                i = ResponseArray.Count;
            }
            return personid;
        }
        catch (Exception)
        {
            return "";
        }
    }
&nbsp;
    private string GetPersonInfo(string personId)
    {
        try
        {
            var client = new RestClient(FaceIDEndpoint + "/face/v1.0/persongroups/" + PersonGroupId + "/persons/" + personId);
            var request = new RestRequest(Method.GET);
&nbsp;
            request.AddHeader("ocp-apim-subscription-key", subscriptionKey);
            request.AddHeader("content-type", "application/json");
            IRestResponse response = client.Execute(request);
&nbsp;
            dynamic PersonData = JObject.Parse(response.Content);
            return PersonData.name;
        }
        catch (Exception)
        {
            return "";
        }
    }
}
				</code>
			</pre>
		</blockquote>
	</strong>
</ol>
<p>To save the details of a User in the database, follow the code below.</p>
<ol>
  <strong>
    <li>Paste the code given below in 'StorageHandler.cs', (i.e) below the comment 'Paste the 'FaceRegistrationUserTable' Class code here...'</li>
    <blockquote>
        <pre>
           <code>
public class FaceRegistrationUserTable
{
    //Connection String
    private static string connectionString = ConfigurationManager.AppSettings["AzureSqlConnectionString"];
    public string error = "";
&nbsp;
    public bool Add(string name, string phone, string gender, string email, string faceid)
    {
&nbsp;
        try
        {
            // Initialization 
            SqlConnection conn;
            SqlCommand cmd;
&nbsp;
            using (conn = new SqlConnection(connectionString))
            {
                // Selecting the perticular row in the table and updating that using particular ID 
                cmd = new SqlCommand("INSERT INTO usertable(name, Phone, gender, email, faceid) VALUES('" + name + "','" + phone + "','" + gender + "','" + email + "','" + faceid + "')", conn);
                //connection open
                conn.Open();
                var temp = cmd.ExecuteNonQuery();
                //connection close
                conn.Close();
                if (temp != 0)
                    return true;
                return false;
            }
        }
        catch (Exception e)
        {
            error = e.Message;
            // Returning the result
            return false;
        }
    }
}
            </code>
        </pre>
   </blockquote></strong></ol>
<h3>Invoke the FaceRegistrationHandler Class from Facade</h3>
<ol>
<strong>
<li>Paste the code given below in 'Facade.cs', (i.e) below the comment 'Paste the 'User_Registration' Function Code here...'</li>
<blockquote>
 <pre>
   <code>
public static List&lt;List&lt;string&gt;&gt; User_Registration(string name, string gender, string phone, string email, byte[] ImageUrl)
{
    FaceRegistrationHandler fc_obj = new FaceRegistrationHandler();
    FaceRegistrationUserTable frt = new FaceRegistrationUserTable();
    List&lt;List&lt;string&gt;&gt; err = new List&lt;List&lt;string&gt;&gt;();
    err.Add(new List&lt;string&gt;());
    string faceid = fc_obj.RegisterFace(ImageUrl, name);
    if (faceid != "")
    {
        frt.Add(name, gender, phone, email, faceid);
        err[0].Add("Registered Successfully");
        err[0].Add("");
        return err;
    }
    else
    {
        if (fc_obj.error != "")
        {
            err[0].Add("Face Not Found");
            err[0].Add("");
            return err;
        }
        err[0].Add("Face Not Found");
        err[0].Add("");
        return err;
    }
}
   </code>
</pre>
</blockquote>
</strong>
</ol>
<h3>Invoke the User_Registration() of Facade Class from HomeController</h3>
<ol>
<strong>
   <li>Paste the code given below in 'HomeController.cs', (i.e) below the comment 'Paste the 'FaceRegisterAPI' Function code here...'</li>
   <blockquote>
     <pre>
       <code>
//Face Register API
public JsonResult FaceRegisterAPI(string data, string name, string gender, string phone, string email)
{
    var imagebyte = Facade.storetoserver(data);
&nbsp;
    List&lt;List&lt;string&gt;&gt; result = Facade.User_Registration(name, gender, phone, email, imagebyte);
&nbsp;
    if (result[0][1] == "")
    {
        return Json(new { Result = result[0][0] });
    }
&nbsp;
    return Json(new { Result = result[0][1] });
}
       </code>
   </pre>
</blockquote>
</strong>
</ol>
<h3>Invoke the Verify API</h3>
<ol>
  <strong>
    <li>Paste the code given below in 'StorageHandler.cs', (i.e) below the comment 'Paste the 'VerifyTimeTable' Class code here...'</li>
    <blockquote>
        <pre>
           <code>
public class VerifyTimeTable
{
    //Connection String
    private static string connectionString = ConfigurationManager.AppSettings["AzureSqlConnectionString"];
    public string error = "";
&nbsp;
    public bool CheckIn(string personid, string date, string time)
    {
&nbsp;
        try
        {
            // Initialization 
            SqlConnection conn;
            SqlCommand cmd;
&nbsp;
            using (conn = new SqlConnection(connectionString))
            {
                // Selecting the perticular row in the table and updating that using particular ID 
                cmd = new SqlCommand("IF NOT EXISTS(SELECT * FROM verifytime WHERE personid = '" + personid + "' AND date = '"+date+ "') INSERT INTO verifytime(personid, date, checkin) VALUES('" + personid + "','" + date + "','" + time + "')", conn);
                //connection open
                conn.Open();
                var temp = cmd.ExecuteNonQuery();
                //connection close
                conn.Close();
                if (temp > 0)
                    return true;
                return false;
            }
        }
        catch (Exception e)
        {
            error = e.Message;
            // Returning the result
            return false;
        }
    }
&nbsp;
    public bool CheckOut(string personid,string date,string time)
    {
&nbsp;
        try
        {
            // Initialization 
            SqlConnection conn;
            SqlCommand cmd;
&nbsp;
            using (conn = new SqlConnection(connectionString))
            {
                // Selecting the perticular row in the table and updating that using particular ID 
                cmd = new SqlCommand("IF EXISTS(SELECT * FROM verifytime WHERE personid = '" + personid + "' AND date = '" + date + "') UPDATE verifytime set checkout ='" + time + "' WHERE personid = '" + personid + "' AND date = '" + date + "'", conn);
                //connection open
                conn.Open();
                var temp = cmd.ExecuteNonQuery();
                //connection close
                conn.Close();
                if (temp > 0)
                    return true;
                return false;
            }
        }
        catch (Exception e)
        {
            error = e.Message;
            // Returning the result
            return false;
        }
    }

}
           </code>
           </pre>
       </blockquote>
   </strong>
</ol>
<h3>Invoke the FaceRegistrationHandler Class from Facade</h3>
<ol>
<strong>
<li>Paste the code given below in 'Facade.cs', (i.e) below the comment 'Paste the 'User_Verification' Function Code here...'</li>
<blockquote>
 <pre>
   <code>
public static List&lt;List&lt;string&gt;&gt; User_Verification(string url, byte[] imagebyte, string gesture, bool CheckIn)
{
    List&lt;List&lt;string&gt;&gt; err = new List&lt;List&lt;string&gt;&gt;();
    err.Add(new List&lt;string&gt;());
&nbsp;
    GestureHandler gshobj = new GestureHandler();
    FaceRegistrationHandler frhobj = new FaceRegistrationHandler();
&nbsp;
        if (gshobj.Validate(url, imagebyte, gesture))
        {
            string result = frhobj.VerifyFace(imagebyte, CheckIn);
            err[0].Add(result);
            err[0].Add("");
            return err;
&nbsp;
        }
        else
        {
            if (gshobj.error != "")
            {
                err[0].Add("Failed");
                err[0].Add(gshobj.error);
                return err;
            }
&nbsp;
            err[0].Add("Failed");
            err[0].Add("Please follow the gesture and try again");
            return err;
        }  
}
   </code>
</pre>
</blockquote>
</strong>
</ol>
<h3>Invoke the User_Verification() of Facade Class from HomeController</h3>
<ol>
<strong>
   <li>Paste the code given below in 'HomeController.cs', (i.e) below the comment 'Paste the 'VerifyAPI' Function code here...'</li>
   <blockquote>
     <pre>
       <code>
//Verify API
public JsonResult VerifyAPI(string data, string random_gesture, bool CheckIn)
{
    var imagebyte = Facade.storetoserver(data);
    string imgefile = "Img" + $@"{System.DateTime.Now.Ticks}.jpg";
    string Url = Server.MapPath(@"~\Images\" + imgefile);
    System.IO.File.WriteAllBytes(Url, Convert.FromBase64String(data));
&nbsp;
    List&lt;List&lt;string&gt;&gt; result = Facade.User_Verification(imgefile, imagebyte, random_gesture, CheckIn);
&nbsp;
    if (result[0][1] == "")
    {
        return Json(new { Result = "Success", VerifiedName = result[0][0] });
    }
&nbsp;
    return Json(new { Result = "Failed", VerifiedName = result[0][1] });
}
       </code>
   </pre>
</blockquote>
</strong>
</ol>
<h3>Till this you can run the solution and get the output</h3>
<p>In the browser, navigate to User -> Register page</p>
<ol>
    <li>Click on the toggle button</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_1.jpg" alt="image" style="max-width: 100%;">
    <li>Browse page will be displayed</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_2.JPG" alt="image" style="max-width: 100%;">
    <li>Click on the Browse button</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_3.jpg" alt="image" style="max-width: 100%;">
    <li>Select the image and click on Submit</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_4.jpg" alt="image" style="max-width: 100%;">
    <li>If all the image validations are passed your image will display in the right side</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_5.JPG" alt="image" style="max-width: 100%;">
    <li>Fill the details and click on submit [Note : Name field is mandatory]</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_6.jpg" alt="image" style="max-width: 100%;">
    <li>Success message will be displayed</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Register/reg_7.jpg" alt="image" style="max-width: 100%;">
</ol>
<p>Navigate to User -> Verify page </p>
<ol>
    <li>Click on the toggle button</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_1.jpg" alt="image" style="max-width: 100%;">
    <li>Click on the Browse button</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_2.jpg" alt="image" style="max-width: 100%;">
    <li>Select the image, click open</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_3.jpg" alt="image" style="max-width: 100%;">
    <li>Click on Check-in</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_5.jpg" alt="image" style="max-width: 100%;">
    <li>Welcome message will be displayed along with your check-in time</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_6.jpg" alt="image" style="max-width: 100%;">
    <li>If check-in button was again clicked, error message will be shown</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_7.jpg" alt="image" style="max-width: 100%;">
    <li>Click on Check-out button</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_8.jpg" alt="image" style="max-width: 100%;">
    <li>Good Bye message will be displayed along with your check out time</li>
    <img src="http://139.59.61.161/MSWorkshop2019/Verify/verify_9.jpg" alt="image" style="max-width: 100%;">
</ol>
<h3>Invoking Audit Log</h3>
<ol>
    <strong>
        <li>Paste the code given below in 'Facade.cs', (i.e) below the comment 'Paste the 'Admin_GestureShow' Function Code here...'</li>
        <blockquote>
            <pre>
                <code>
public static List&lt;gesture_management&gt; Admin_GestureShow()
{
  GestureTable gstobj = new GestureTable();
&nbsp;
  return gstobj.List();
}
                </code>
            </pre>
        </blockquote>
    </strong>
<strong>
        <li>Paste the code given below in 'Facade.cs', (i.e) below the comment 'Paste the 'Admin_GestureEdit' Function Code here...'</li>
        <blockquote>
            <pre>
                <code>
public static gesture_management Admin_GestureEdit(string id)
{
   GestureTable gt = new GestureTable();
   &nbsp;
   return gt.Edit(id);
}
                </code>
            </pre>
        </blockquote>
</strong>
<strong>
        <li>Paste the code given below in 'Facade.cs', (i.e) below the comment 'Paste the 'Admin_GestureUpdate' Function Code here...'</li>
        <blockquote>
            <pre>
                <code>
public static bool Admin_GestureUpdate(string id, String isactive)
{
    GestureTable gt = new GestureTable();
    &nbsp;
    return gt.Update(id,isactive);
}
                </code>
            </pre>
        </blockquote>
</strong>
<strong>
        <li>Paste the code given below in 'Facade.cs', (i.e) below the comment 'Paste the 'Admin_GestureAdd' Function Code here...'</li>
        <blockquote>
            <pre>
                <code>
public static bool Admin_GestureAdd(string gesture_name, string thumbnail_url, string gesture_message, string isactive)
{
    GestureTable gstobj = new GestureTable();
&nbsp;
    if (gstobj.Add (gesture_name, thumbnail_url, gesture_message, isactive))
    {
        return true;
    }
&nbsp;
    return false;
}
                </code>
            </pre>
        </blockquote>
</strong>
<li></li>
    <img src="" alt="image" style="max-width: 100%;">
</ol>
<h3>Congratulations! You have successfully completed Challenge 3</h3>
<h3>The next session is<a href="https://github.com/jumpstartninjatech/HeroSolutions-AI/blob/master/Challenge4.md"> Challenge 4</a></h3>