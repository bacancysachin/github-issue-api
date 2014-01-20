
class GithubController < ApplicationController
  
  def index
  	#using the github_api gem for fetching the in progress issues. Here We need a clarification about in progress issues. Github shows in progress issues in milestones. Please suggest on this.
  	github = Github::Issues.new 
  	@in_progress = github.milestones(user: 'sinatra', repo: 'sinatra').list 
  	
  	#used the octokit gem to fetch 50 recent closed and open issues here 
	@open_issues = Octokit.issues 'sinatra/sinatra', :state => "open", :per_page => 50
	@closed_issues = Octokit.issues 'sinatra/sinatra', :state => "closed", :per_page => 50
    

  end
end
