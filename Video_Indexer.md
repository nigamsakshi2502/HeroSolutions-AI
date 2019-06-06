<h1>AI Series HOL</h1>
<h2>Challenge 1 – Existing Video Indexer</h2>
<p>In Challenge 1 we are going to explore about how the Video Indexer works using Azure API.</p>
<h2>Getting Started</h2>
<h3>Prerequisites</h3>
<li>Kindly ensure that the Visual Studio works fine</li>
<h3>Code Summary</h3>
<p>This application has two cshtml files. The two files are playing the major role in this application.The index.cshtml file is used to navigate the videoinsights.cshtml file.</p>
<p>The videoinsights.cshtml file is having all the Azure functionalities.</p>
<h3>Invoking the Video Indexer</h3>
<p>Just Clone the Video Idexer HOL Completed Kit from the <a href="">Git Repository.</a></p>
<h3>Things that you need to do in Completed Kit</h3>
<li>Open the Video Idexer Completed Kit application.</li>&nbsp;
<img src=" alt="image" style="max-width:100%;">
<p>Just copy and paste the code in Web.config file that is given below in the code Snippet</p>
<li>Follow the picture given below to navigate the Web.config file</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">
<ol>
  <strong>
  	<li>Paste the code given below in 'Web.config', (i.e) below the comment 'Player 1 details...'</li>
  	<blockquote>
        <pre>
           <code>
&lt;add key ="VideoPlayer1" value="https://www.videoindexer.ai/embed/player/4756daa9-ccf9-4be5-ad70-d07200c86f53/acaef95928/"/&gt;
&lt;add key ="VideoInsights1" value="https://www.videoindexer.ai/embed/insights/4756daa9-ccf9-4be5-ad70-d07200c86f53/acaef95928/"/&gt;
            </code>
        </pre>
   </blockquote>
   	<li>Paste the code given below in 'Web.config', (i.e) below the comment 'Player 2 details...'</li>
  	<blockquote>
        <pre>
           <code>
&lt;add key ="VideoPlayer2" value="https://www.videoindexer.ai/embed/player/4756daa9-ccf9-4be5-ad70-d07200c86f53/01353fb32d/"/&gt;
&lt;add key ="VideoInsights2" value="https://www.videoindexer.ai/embed/insights/4756daa9-ccf9-4be5-ad70-d07200c86f53/01353fb32d/"/&gt;
            </code>
        </pre>
   </blockquote>
  </strong>
</ol>   
<h2>Outputs</h2>
<li>In the solution explorer [View -> Solution Explorer]</li>&nbsp; 
<img src="" alt="image" style="max-width:100%;">
<li>Right click on the solution name and select Build</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">
<li>Make sure that no error is thrown after building your application</li>
<li>Now click on the Run button to run and see the application's output in the browser</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">
<li>Following are the output screens of the application.</li>
<li>Result1</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">&nbsp;
<li>Result2</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">&nbsp;
<li>Result3</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">&nbsp;
<li>Result4</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">&nbsp;
<li>Result5</li>&nbsp;
<img src="" alt="image" style="max-width:100%;">&nbsp;
<h3>Next steps</h3>
<li><a href="">Challenge 2: Creating new Video Indexer</a> or <a href="">Back to ReadMe</a></li>