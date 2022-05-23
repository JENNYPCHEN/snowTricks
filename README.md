# snowTricks
<a href="https://codeclimate.com/github/JENNYPCHEN/snowTricks/maintainability"><img src="https://api.codeclimate.com/v1/badges/c7d07d8715fd50ac99e4/maintainability" /></a>
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/32c3fcd15baf41ea87e20050e9e3d754)](https://www.codacy.com/gh/JENNYPCHEN/snowTricks/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=JENNYPCHEN/snowTricks&amp;utm_campaign=Badge_Grade)

Hello,

Thank you for your interest in my project. This project is to build a community website using the Symfony Framework.
This is part of my Php/Symfony training from OpenClassrooms.

Please let me know what you think about my project. All thoughts and suggestions are greatly appreciated.

![project6pic1](https://github.com/JENNYPCHEN/snowTricks/blob/main/Picture1.png)
<p align="center">frontpage</p>

![project6pic2](https://github.com/JENNYPCHEN/snowTricks/blob/main/Picture2.png)
<p align="center">comment function</p>

<h2>Features</h2>
<li>A user registration system with e-mail confirmation for the new sign up.<br></li>
<li>A user password reset system.<br></li>
<li>Load more pagination system without refreshing page for homepage and comment section.<br></li>
<li>Images upload and videos sharing on the website.<br></li>
<li>Logged in user can create, update, delete posts and leave a comment.<br></li>

<h2>Prequisites</h2>
<li>PHP > 7.4.9<br></li>
<li>Symfony > 5.4 <br></li>
<li>Local server, e.g. XAMPP/WAMP for local use.<br></li>
<li>SMTP server with mailing service .<br></li>
<li>MySQL DBMS such as phpMyAdmin<br></li>
<li>Libraries will be installed using Composer.<br></li>
<li>CSS/JS libraries are called directly via CDN ( Font Awesome 5, Jquery) except Bootstrap is included in the folder.<br></li>

<h2>Starting the application</h2>
You can run the application on your computer for development and testing purposes by following the simple steps below:<br>

<h3>Installation</h3>

<h4>Step1 Clone / Download</h4>
Clone the repository of this page.Open the folder "P6SnowTricks" 

<h4>Step 2 Configure environment variables</h4>
Open .env file and modify line22 ( symfony/mailer) and line 29 (database URL) with your own detail.

<h4>Step 3 Install all dependencies</h4>
Install Composer if you do not have it yet. All dependencies should be installed in a vendor directory.

<h4>Step 4 Create database</h4>
Create a new database using the command below:<br>
php bin/console doctrine:database:create<br>
php bin/console doctrine:migrations:migrate<br>
You can import fixture by running the command below:<br>
php bin/console doctrine:fixtures:load

<h4>Wohooo!</h4>
You can now sign up for an account and confirm your sign up with e mail confirmation, then you are ready to go! Or you can simply browse the website as a visiter!

<br>
Enjoy!<br>
<br>
ChingYi P.C<br>
<a href="http://chingyipc.com">http://chingyipc.com</a>
<br>
<br>
<p>P.S if you would like to have a quick look of this project, you can go to the link below:</p>
http://snowtricks.chingyipc.com/

