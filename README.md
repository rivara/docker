<h1> Docker: Nginx, PHP and MySql with Laravel. </h1>

<h2>Overview</h2>
<ol>
    <li value="1">
    <p><a href="#prerequisites">Install prerequisites</a></p>
    <li>
      <p>Clone the project git clone https://github.com/rivara/docker.git dockerLaravel</p> 
    </li>
      <p>/project/example-app/cp .example.env .</p>
    </li>
    <li>
      <p>docker-compose up -d --build</p>
    </li>
    <li>
      <p>Important create de database before </p>
     </li>
    <li>
        <p>In the container, navigate to the project path</p>
        <p>- docker-compose exec php bash</p>
        <p>- cd www/projects/example-app/</p>
        <p>- compose update </p>
        <p>- npm run build</p>
        <p>- php artisan optimize</p>
        <p>- php artisan migrate</p>  
    </li>
</ol>
</section>
<hr>

<section id="prerequisites" style="padding: 10px;">
<h2> Install prerequisites </h2>
<p>This environment was created on windows but all docker things will work on any SO. Just follow install instructions on documentation:</p>
<ul>
  <li><a href="https://docs.docker.com/engine/install/">Docker</a></li>
  <li><a href="https://docs.docker.com/compose/install/">Docker Compose</a></li>
</ul>
<p>Check if all dependencies is installed by entering the following command's in your terminal:</p>
<pre>
docker-compose 
docker -v
</pre>
<blockquote>
[<code>docker-compose</code>] will print all docker-compose commands and [<code>docker -v</code>] will print docker version.
</blockquote><br>
<p>Optional tools:</p>
<ul>
  <li><a href="https://git-scm.com/downloads">Git</a></li>
  <li><p>Make (Chocolatey)</p> <code>choco install make</code></li>
  </br>
  <li><p>Make  (Ubuntu) </p><code>sudo apt-get -y install make</code></li>
</ul>
</section>
<hr>
