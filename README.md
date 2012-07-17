The-Merry-Project-Tracker
=========================

We wanted a simple display of the story cards currently in play.
We use [AgileZen](www.agilezen.com) to track our projects.
[AgileZen](www.agilezen.com) has a simple API.
I wanted to play with [Sinatra](http://www.sinatrarb.com).
These are the results.

Usage
=====

API_KEY refers to the key [generated](http://dev.agilezen.com/concepts/authentication.html) for a [AgileZen](http://www.agilezen.com) user

/{API_KEY}/projects
	- lists all the projects associated with the user

/{API_KEY}/projects/{project_id}
	- lists all the stories for a particular [project_id]

/{API_KEY}/projects/{project_id}/inprogress
	- lists all the stories currently being worked on for a particular [project_id]