<h1>AI Tech Series – Hackathon</h1>
<h1>Challenge 1 – Image Validation</h1>
<p>In this Challenge 1, you have to use the Azure's Face API to validate the given image (the image should be taken from the live stream or also can use a local image) and connect with Azure SQL Server Database.</p>
<h2>Getting Started</h2>
<p>If needed you can download the <b>AI Series HOL Starter Kit</b> from the <a href="https://github.com/jumpstartninjatech/HeroSolutions-AI/tree/master/HOLs/AI_Series_Starter_Kit">Git Repo</a></p>
<h3>Prerequisites</h3>
    <li>Kindly ensure that your Visual Studio and SQL Server Management Studio are working fine. [You can also access the SQL Server through Azure Portal]</li>
    <li>If you are using the <b>AI Series Starter Kit</b> application follow the below steps to build and run it. Else you can create your own application.</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Invoke_StarterKit/1.PNG" alt="image" style="max-width:100%;">
    <li>In the solution explorer [View -> Solution Explorer]</li>&nbsp; 
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Invoke_StarterKit/2.PNG" alt="image" style="max-width:100%;">
    <li>Right click on the solution name and select Build</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Invoke_StarterKit/3.PNG" alt="image" style="max-width:100%;">
    <li>Make sure there are no errors once the build is complete.</li>
    <li>Now click on the Run button and see the application's output in the browser</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Invoke_StarterKit/4.PNG" alt="image" style="max-width:100%;">
 <h4>Sample Screens</h4>
    <li>Following are the output screens of the <b>AI Series Starter Kit</b> application. Since the database doesn't contain any entries, all the screens will be empty.</li>
    <li>Home page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/main.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Admin page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/admin_1.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Admin Index page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/admin_index.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Image Validation page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/admin_index_1.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Image Validation page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_validation.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Gesture Management page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/admin_index_2.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Gesture Management page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/gesture_management.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Audit Log page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/admin_index_3.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Audit Log page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/audit_log.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to User page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/User/user_1.png" alt="image" style="max-width:100%;">&nbsp;
    <li>User Index page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/User/User_Index.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Register page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/User/User_Index_1.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Register page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/User/Register_Page.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Verify page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/User/User_Index_2.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Verify page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/User/Verify_Page.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Legal Document Verification page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Document_Verification/doc.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Legal Document Verification page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Document_Verification/doc_1.PNG" alt="image" style="max-width:100%;">&nbsp;
    <li>Navigating to Quality Control Check page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Quality_Check/QCC_1.png" alt="image" style="max-width:100%;">&nbsp;
    <li>Empty Quality Control Check page</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Quality_Check/QCC_2.PNG" alt="image" style="max-width:100%;">&nbsp;
    <h2>Nuget Packages to be installed</h2>
    <p>The Nuget packages to be installed in this project are, </p>
        <ol><li>RestSharp</li>
        <li>Microsoft.Azure.CognitiveServices.Vision.ComputerVision</li></ol>
    <p>Below is a sample installation procedure</p>
    <li>Installing the 'RestSharp' Nuget Package</li>
    <li>Click on Tools -> NuGet Package Manager -> Manage NuGet Packages for Solution</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Invoke_StarterKit/5.PNG" alt="image" style="max-width:100%;">
    <li>Click on the Browse tab, type <b>RestSharp</b> and press enter. From the search result set, select the specified package & project and click on Install</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Invoke_StarterKit/6.PNG" alt="image" style="max-width:100%;">&nbsp;
    <p>By following the above procedure install those 2 nuget packages.</p>
<h2>Getting Started with your today's task - Following are the guidelines to work on the Computer Vision API</h2>
<h3>Objective : Convert an Image into Byte array</h3>
<h3>Psuedo Code : </h3>
<p><b>STEP 1 : </b>Create a function [so that you can reuse the code], to store the image data into an byte array</p>
<p>Lets move on to the Face API...</p>
<h3>Create a Face API Key</h3>
<ol>
  <strong>
    <li>Sign-in to Azure Portal by typing "portal.azure.com" in browser, enter your username</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_1.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Enter your Password</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_2.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Click on create a resource</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_3.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>In the search box type 'face'</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_4.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Click on create</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_5.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Enter name and select location, pricing tier and resource group</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_6.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Click on Overview tab</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_7.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Copy the endpoint</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_8.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Click on Keys tab</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_9.jpg" alt="image" style="max-width: 100%;">&nbsp;
    <li>Copy the Keys</li>&nbsp;
    <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/face_computer_portal/faceAPI_create/portal_10.jpg" alt="image" style="max-width: 100%;">&nbsp;
  </strong></ol>
<h3>Objective : Invoke the Face API</h3>
<h3>Psuedo Code : </h3>
<p><b>STEP 1 : </b>Create a function to call the Azure Face API [use the image byte array value as input] and check for four attributes from the json response. [This function will be called as the <b>Image Validation</b> function]</p> 
<p><b>STEP 2 : </b>Four attributes to be checked for the given image - Face availability, Multiple Face check, Sunglasses check and allowed Emotions.</p>
<p><b>STEP 3 : </b>Face availability - check whether the face is available or not, Mutiple Face check - check if there are mutiple faces, Sunglasses - check for sunglasses [reading glasses are allowed] and Allowed Emotions - check for anger, sad and surprise emotions.</p>
<p><b>STEP 4 : </b>Make condition statements in your code according to the above specifications.</p>
<p><b>STEP 5 : </b>That is if all the four attributes are succeded display the taken image as preview in the right side or else show the specific error message.</p>
 <h3>Till this you can run the solution and should get the output like the following screens</h3>
    <p><b>STEP 1 :</b> Make sure you take the picture with a face to pass the face availability. Also take a picture without showing the face in the camera to get the error message 'Face not found'</p>
    <p><b>STEP 2 :</b> Make sure you take the picture with a single person to pass the multiple face check. Also take a picture with more than one person to get the error message 'Multiple Faces are not allowed'</p>
    <p><b>STEP 3 :</b> Make sure you take the picture without wearing sunglasses to pass the sunglasses check. Also take a picture sunglasses to get the error message 'Please remove the sunglasses'. [Note : Reading glasses are allowed]</p>
    <p><b>STEP 4 :</b> Make sure you do not show emotions such as anger, sadness and surprise while taking the picture to pass the allowed emotions check. Also take a picture with the above specified emotions to get the error message 'Your expression must be Neutral'</p>
  <h2>Sample Outputs</h2>
  <li>Face availability test case</li>&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/1.PNG" alt="image" style="max-width: 100%;">&nbsp;
  <li>Multiple face test case</li>&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/2.PNG" alt="image" style="max-width: 100%;">&nbsp;
  <li>Sunglasses test case</li>&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/3.PNG" alt="image" style="max-width: 100%;">&nbsp;
  <li>Reading glasses are allowed</li>&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/4.PNG" alt="image" style="max-width: 100%;">&nbsp;
  <li>Allowed Emotions test case - Anger, Sad, Surprised emotions are not allowed</li>&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/5.PNG" alt="image" style="max-width: 100%;">&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/6.PNG" alt="image" style="max-width: 100%;">&nbsp;
  <img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Emotions/7.PNG" alt="image" style="max-width: 100%;">&nbsp;
<h4>NOTE : To access the Azure SQL server you can use any one of the following options [(i.e) 'SQL Server Management Studio' or 'Azure Portal'], both the procedures are explained below.</h4>
<h3>Azure SQL Server Database Connectivity through "SQL Server Management Studio"</h3>
<li>Open SQL Server Management Studio</li>
<li>To connect with the Azure SQL Server, you have to provide Server name, Login and Password details.</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/1.jpg" style="max-width:100%;">
<p>Download the script file from the <a href="https://github.com/jumpstartninjatech/HeroSolutions-AI/blob/master/HOLs/HOL_Script.sql">GitHub</a></p> 
<h2>Sample screens for how to run the script file</h2>
<li>Open the script file from the path where you have saved the downloaded GIT script file</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/2.jpg" style="max-width:100%;">&nbsp;
<li>Select the appropriate script file, and click on open</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/3.jpg" style="max-width:100%;">&nbsp;
<li>Run the script file to create all the tables (usertable, imagevalidation, gesture, auditlog, verifytime)</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/4.jpg" style="max-width:100%;">&nbsp;
<li>Click the Execute button to run the script</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/5.jpg" style="max-width:100%;">&nbsp;
<li>Output message</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/6.jpg" style="max-width:100%;">&nbsp;
<li>Till now you have created all the tables, click on the database to visualize the tables </li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/7.jpg" style="max-width:100%;">&nbsp;
<li>Click your Database</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/8.jpg" style="max-width:100%;">&nbsp;
<li>Click tables</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/9.jpg" style="max-width:100%;">&nbsp;
<li>List of all the tables</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/DB_Creation/10.jpg" style="max-width:100%;">&nbsp;
<h3>Azure SQL Server Connectivity through "Azure Portal"</h3>
<li>Sign-in to Azure Portal by typing "portal.azure.com" in browser, enter your username</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql0c.JPG" alt="image" style="max-width: 100%;">&nbsp;
<li>Enter your Password</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql0.1c.JPG" alt="image" style="max-width: 100%;">&nbsp;
<li>Click on SQL databases tab in the left pane</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql1.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Select your particular database</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql2.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Click on Query editor</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql3.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Specify your database password</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql5.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Copy all the queries from <a href="https://github.com/jumpstartninjatech/HeroSolutions-AI/blob/master/HOLs/HOL_Script.sql">sql script file</a></li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql4.jpg" alt="image" style="max-width: 100%;">&nbsp;  
<li>Paste all the queries in the editor pane and click on Run button</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql6.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Now click on Connection strings tab in the left pane</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql7.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Copy your Connection string</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/sql/sql8.jpg" alt="image" style="max-width: 100%;">&nbsp;
<h3>Objective : Invoke the image validation Admin part</h3>
<h3>Psuedo Code : </h3>
<p><b>STEP 1 : </b>Create a function to fetch all the details from the <b>imagevalidation</b> table and display it in the front end</p>
<p><b>STEP 2 : </b>While displaying the <b>imagevalidation</b> table details, you should provide a enable-disable option in the front end</p>
<p><b>STEP 3 : </b>By default in the <b>imagevalidation</b> table all the four validation types are enabled</p>
<p><b>STEP 4 : </b>If the user disables the validation type it should also be reflected in the <b>imagevalidation</b> table [(i.e) <b>isactive</b> field value in <b>imagevalidation</b> table should be updated to 1]</p>
<p><b>STEP 5 : </b>The user should be able to enable or disable from front end and it should be updated in the database</p>
<h3><b>NOTE : </b>The following procedures are needed only when you are using the 'AI Series Starter Kit' application</h3>
<p>Un-comment the code in design screens</p>
<ol>
<strong>
<li>Open image_validation.cshtml [In solution explorer, Views -> Home -> image_validation.cshtml]</li>
<li>Select the code from line number 221</li>
<li>Select the code till line number 270</li>
<li>Click on the uncomment button</li>
<li>If you are using this option you have to create your own model class also accordingly or else you can skip the above steps and handle that feature in your own way.</li>
</ol>
<h3>Sample output</h3>
<h4>Click the Run button and see the output in the admin side</h4>&nbsp;
<li>Admin Image Validation with entries [ADMIN -> IMAGE VALIDATION]</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_1.JPG" alt="image" style="max-width: 100%;">&nbsp;
<li>Selecting the Edit Button</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_2.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Getting modal box</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_3.JPG" alt="image" style="max-width: 100%;">&nbsp;
<li>Selecting Enable button</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_4.jpg" alt="image" style="max-width: 100%;">&nbsp;
<li>Disabled by clicking on the enable button </li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_5.JPG" alt="image" style="max-width: 100%;">&nbsp;
<li>Updating the table</li>&nbsp;
<img src="http://139.59.61.161/Hackathon/MSWorkshop2019/Admin/image_6.jpg" alt="image" style="max-width: 100%;">&nbsp;
</strong>
<h3>Congratulations! You have successfully completed Challenge 1</h3>
<h3>The next session is<a href="https://github.com/jumpstartninjatech/HeroSolutions-AI/blob/master/Challenge2.md"> Challenge 2</a></h3>