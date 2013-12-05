Simple JIRA
-----------
[![Code Climate](https://codeclimate.com/repos/5261aa9256b10235ed104300/badges/fc3602c892b10c422d94/gpa.png)](https://codeclimate.com/repos/5261aa9256b10235ed104300/feed)[![Build Status](https://travis-ci.org/tomszymanski/simple_jira.png?branch=master)](https://travis-ci.org/tomszymanski/simple_jira)

This is a basic JIRA app that
  1. Return a total count of a list of queries in query.yml
  2. Generate release notes for a project
    
Make sure to do this to prevent adding your personal credentials:
  ```
  git update-index --assume-unchanged config/config.yml
  ```
Next you'll need to update your config file with your LDAP credentials:
  ```
  vim config/config.yml
  ```
## Generating Release Notes

Example for generating release notes for the MEME project with an 'accepted' status:
  ```
  ruby app/simplejira.rb release_notes MEME accepted
  ````
  This will grab all items in the accepted column and display in GitHub markup


