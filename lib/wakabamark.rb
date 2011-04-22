module ApplicationHelper
  def wakabamark(text)
    code_blocks = []
    text.gsub!(/``(.+?)``/m) do |block| #hide code
      code_blocks.push($1)
      "<>"
    end

    b.call(text) unless b.nil?

    text.gsub!(/^&gt;(.*)/, '<span style="color:green">&gt;\1</span>')#quote
    text.gsub!(/\n/, '<br>')
    text.gsub!(/(\*\*)(.+?)\1/, '<b>\2</b>')#bold
    text.gsub!(/(\*)(.+?)\1/, '<i>\2</i>')#italic
    text.gsub!(/(\%\%)(.+?)\1/, '<span class="spoiler">\2</span>')#spoiler, add to css: 
                                                                  #span.spoiler {background: #BBBBBB; color: #BBBBBB;} 
                                                                  #span.spoiler:hover {color: #333333;}
    text.gsub!(/(\_\_)(.+?)\1/, '<span style="text-decoration: underline;">\2</span>')#underline
    text.gsub!(/(\-\-)(.+?)\1/, '<s>\2</s>')#strike

    code_blocks.each{ |block| text.sub!(/<>/){ '<pre><code>'+block+'</code></pre>' } }

    text
  end
end
