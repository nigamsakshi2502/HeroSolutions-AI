<h1>AI Series HOL</h1>
<h2>Challenge 6 – Integration of NLP based Chat bot for Task Management</h2>
<p>In Challenge 6 we are going to explore about how to Track status and Report status using Bot application</p>
<h2>Getting Started</h2>
<h3>Prerequisites</h3>
<ol>
<li>Kindly ensure that the application works fine so far.</li>
<li>We are going to build the NLP based Chat bot for Task Management in the same application</li></ol>
<h3>Azure SQL Server Connectivity through Azure Portal</h3>
<li>Sign-in to Azure Portal by typing "portal.azure.com" in browser, enter your username</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql0.JPG" alt="image" style="max-width: 100%;">
<li>Enter your Password [W!pro!Azure1]</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql0.1.JPG" alt="image" style="max-width: 100%;">
<li>Click on SQL databases tab in the left pane</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql1.jpg" alt="image" style="max-width: 100%;">
<li>Select your particular database</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql2.jpg" alt="image" style="max-width: 100%;">
<li>Click on Query editor</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql3.jpg" alt="image" style="max-width: 100%;">
<li>Specify your database password</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql5.jpg" alt="image" style="max-width: 100%;">
<li>Copy all the queries from <a href="https://github.com/jumpstartninjatech/HeroSolutions-AI/blob/master/HOLs/BotDB_Script.sql">sql script file</a></li>
<img src="http://139.59.61.161/MSWorkshop2019/Bot.PNG" alt="image" style="max-width: 100%;">   
<li>Paste all the queries in the editor pane and click on Run button</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql6.jpg" alt="image" style="max-width: 100%;">
<li>Now click on Connection strings tab in the left pane</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql7.jpg" alt="image" style="max-width: 100%;">
<li>Copy your Connection string</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql8.jpg" alt="image" style="max-width: 100%;">
<h4>Paste your SQL server connection string in Web.config (i.e) for the key 'AzureSqlConnectionString', in the connection string specify your database user name and password, make 'MultipleActiveResultSets' as True</h4>
<p>Sample Connectionstring : "Server=tcp:jsn.database.windows.net,1433;Initial Catalog=dbname;Persist Security Info=False;User ID=demouser; Password=demo@pass123;MultipleActiveResultSets=True;Encrypt=True; TrustServerCertificate=False;Connection Timeout=30;"</p>
<h3>Design Changes</h3>
<ol>
	<strong>
	<li>Navigate to index.cshtml</li>&nbsp;
	<img src="http://139.59.61.161/MSWorkshop2019/BOT/Bot4.PNG" alt="image" style="max-width: 100%;">&nbsp;
	<li>Navigate to the code line specified in the below image</li>&nbsp;
	<img src="http://139.59.61.161/MSWorkshop2019/BOT/Bot3.PNG" alt="image" style="max-width: 100%;">&nbsp;
	<li>Paste the below code</li>
		<blockquote>
			<pre>
				<code>
&lt;link rel="stylesheet" type="text/css" href="http://139.59.61.161/MSWorkshop2019/chatbot.css"/&gt;
				</code>
			</pre>
		</blockquote>
	<li>Scroll to the code line specified in the below image</li>&nbsp;
	<img src="http://139.59.61.161/MSWorkshop2019/BOT/Bot51.PNG" alt="image" style="max-width: 100%;">&nbsp;
	<li>Paste the below code</li>
		<blockquote>
			<pre>
				<code>
&lt;button class="open-button" id="open_button" onclick="openForm()"&gt;&lt;i class="fa fa-comments" style="font-size: 30px;color:white;"&gt;&lt;/i&gt;&lt;/button&gt;

&lt;div class="chat-popup" id="myForm" style="z-index:999999;"&gt;

&lt;form class="form-container"&gt;
&lt;h6 style="color:black;float:left"&gt;Task Management&lt;/h6&gt;
&lt;button type="button" class="btn cancel" onclick="closeForm()" style="background:transparent;padding:0px;margin:0px;float:right;width:10%;"&gt;&lt;i class="fa fa-window-close" style="font-size: 20px;color:black;margin-top:5px;"&gt;&lt;/i&gt;&lt;/button&gt;
&lt;iframe style="width:100%;height:450px;" src="https://webchat.botframework.com/embed/victory?s=HY-AAbU9GUs.cwA.hbA.dZeQsadDNIMNMb-ovGOmO8NrRoxeYSEE8MvtZDEdHao" frameborder="0" scrolling="auto" marginheight="0" marginwidth="0"&gt;&lt;/iframe&gt;

&lt;/form&gt;
&lt;/div&gt;
				</code>
			</pre>
		</blockquote>
	</strong>
</ol>