require 'erector'
require 'courses'

class Home < Erector::Widget

  external :js, "https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"
  external :js, "/zrssfeed-119/jquery.zrssfeed.min.js"
  external :css, "/zrssfeed-119/jquery.zrssfeed.css"

  external :style, <<-CSS
div.bubble {
  border: 1px solid black;
  box-shadow: #c8c8f1 2px 2px 4px;
  max-width: 30em;
  padding: .25em 1em;
  margin-bottom: 1em;
}
div.bubble h2 {
  -webkit-margin-before: 0;
  -webkit-margin-after: 0;
  -webkit-margin-start: 0;
  -webkit-margin-end: 0;
}
div.blog {
  float: right;
  max-width: 24em;
}
div.blog .rssHeader > a:after {
  content: ' - Recent Blog Entries'
}
  CSS

  def content
    blog

    div.bubble {
      p {
        text "I'm "
        a "Alex Chaffee", href: "http://alexchaffee.com"
        text " and I want to teach you how to code! This site contains my lectures and labs on Ruby, JavaScript, and more, in outline, slide, and video format."
      }
      p {
        text "Click on "
        a "Lessons", href: "/lessons"
        text " in the nav bar to get started. And I'm updating it every week or so with new videos and notes, so keep checking back!"
      }
    }

    div.bubble {
      h2 "Licensing and Donations"
      p "Please click the 'Donate' button in the top right corner to support this project financially."
      p "I intend to make the vast majority of these materials open source, and completely free for either personal use or open workshops."
      p "If you're using them to teach a class that you're getting paid for, I ask for a donation of $25 (or more) per student in your class."
    }
  end

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

  #external :

  def blog
    jquery :ready,  <<-JAVASCRIPT
      $('#blog_feed').rssfeed('http://codelikethis.tumblr.com/rss', {
        limit: 5
      });
    JAVASCRIPT
    div.blog do
      div.blog_feed!
    end
  end

end
