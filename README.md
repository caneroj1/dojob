<h1>Dojob</h1>
[![Build Status](https://travis-ci.org/caneroj1/dojob.svg?branch=master)](https://travis-ci.org/caneroj1/dojob)
<p>Dojob is a Ruby on Rails application I am working on that will allow college students to get in touch with people in the surrounding areas to perform quick jobs for easy money. Users can post jobs, and other users can accept those jobs and work on them and get paid. The following is a brief list of some of the kinds of jobs available:</p>
<ul>
<li>Lawncare</li>
<li>Tutoring</li>
<li>Childcare</li>
<li>Petcare</li>
</ul>

<p>It is written in Rails 4, and requires elasticsearch, imagemagick, and faye to run successfully. Once an elasticsearch server is installed, you can run rake elasticsearch:start to start that and then you can run rake faye:start to run the faye server for real-time chat. If imagemagick is not installed, run brew install imagemagick to install it on OS X.</p>
<p> To start elasticsearch:
elasticsearch --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
</p>

<h2>Screenshots of Dojob</h2>
<p>The following is a screenshot of the main page of the application.</p>
<img src="./app/assets/images/readme_imgs/main.png">
<br>

<p>After a user logs in, they are taken to their dashboard, where they can see a list of the jobs they've posted.</p>
<img src="./app/assets/images/readme_imgs/dashboard1.png">
<br>

<p>A user can also choose to post a job, which entails filling out some basic information and tagging it.</p>
<img src="./app/assets/images/readme_imgs/dashboard2.png">
<br>

<p>A user is also able to fill out some skill surveys for some of the more important jobs, giving other users some assurance that they are trustworthy and skilled.</p>
<img src="./app/assets/images/readme_imgs/dashboard3.png">
<br>

<p>Once a user makes an offer for a job, or someone has made an offer to them, they are able to see the list of offers and chat in real-time with the appropriate user.</p>
<img src="./app/assets/images/readme_imgs/offers1.png">
<br>
<img src="./app/assets/images/readme_imgs/offers2.png">
<br>

<p>A user is also able to look at the list of all jobs currently available, as well as filter by tag and search.</p>
<img src="./app/assets/images/readme_imgs/jobs.png">
<br>

<p>Each user also has their own profile, which will display their references, certifications, availability and other resume-esque information. Right now, only references and availability are done. This is what it looks like to add a new reference to your list of references.</p>
<img src="./app/assets/images/readme_imgs/add_refs.png">
<br>

<p>This is what it looks like to update your availability. The user can click within one of the little squares to mark it off as unavailable, or use the menu on the right side to mark off chunks at a time.</p>
<img src="./app/assets/images/readme_imgs/avail.png">
<br>

<p>This what the user profile looks like so far when it is not in edit mode. References and availability are displayed for all users to see.</p>
<img src="./app/assets/images/readme_imgs/profile.png">
<br>
