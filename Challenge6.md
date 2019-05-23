<h1>AI Series HOL</h1>
<h2>Challenge 6 – Integration of NLP based Chat bot for Task Management</h2>
<p>In Challenge 6 we are going to explore about how the </p>
<h2>Getting Started</h2>
<h3>Prerequisites</h3>
<ol>
<li>Kindly ensure that the application works fine so far.</li>
<li>We are going to build the NLP based Chat bot for Task Management in the same application</li></ol>
<h3>Code Summary</h3>
<p></p>
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
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql4.jpg" alt="image" style="max-width: 100%;">   
<li>Paste all the queries in the editor pane and click on Run button</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql6.jpg" alt="image" style="max-width: 100%;">
<li>Now click on Connection strings tab in the left pane</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql7.jpg" alt="image" style="max-width: 100%;">
<li>Copy your Connection string</li>
<img src="http://139.59.61.161/MSWorkshop2019/sql/sql8.jpg" alt="image" style="max-width: 100%;">
<h4>Paste your SQL server connection string in Web.config (i.e) for the key 'AzureSqlConnectionString', in the connection string specify your database user name and password, make 'MultipleActiveResultSets' as True</h4>
<p>Sample Connectionstring : "Server=tcp:jsn.database.windows.net,1433;Initial Catalog=dbname;Persist Security Info=False;User ID=demouser; Password=demo@pass123;MultipleActiveResultSets=True;Encrypt=True; TrustServerCertificate=False;Connection Timeout=30;"</p>
