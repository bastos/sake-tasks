desc "Mostra as questões de um usuário no Brasigo"
task :brasigo=>:hpricot do |t, args|
  exit if ENV['USER'].nil?
  page = Hpricot(open("http://brasigo.com.br/usuario/#{ENV['USER']}/perguntas"))
  page.search('.question_element_box .question_box').each do |el|
    puts el.at('.question').inner_text.strip
    puts "http://brasigo.com.br" + el.at('.question a').attributes['href']
    puts el.at('.user_data .data').inner_text.strip
    puts el.at('.question_numbers').inner_text.squeeze(" ").gsub(/\n|\t/,"")
    puts "---"
  end
end
