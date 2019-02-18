# Load a file with questions and answers
# Make an array with a structure for each pair of question/answer
# Loop with questions answered, failed and a new question
# In the loop, inform the user for a method to quit the game

class Reto5
  def initialize(file)
    return puts "No puedo encontrar el archivo de Definiciones" unless File.file?(file)

    data = []

    file = File.read(file)
    file.each_line do |line|
      if line != "\n"
        data << line.chomp
      end
    end
    @questions, @answers = data.group_by.with_index { |i,j| j % 2}.values #group_by takes j % 2 as a condition which divides in even and odd (zero non zero result) 
    puts "\n\nBienvenido a Reto 5.\n\nPara jugar, solo ingresa el término correcto para cada una de las definiciones, ok?"
    puts "\nEn cada definición tendrás 3 oportunidades para responder si fallas.\n"
    puts "Empecemos!\n\n\n"
  end

  def preguntar
    @questions.each_with_index do |i, j|
        oportunidades = 3
        while oportunidades > 0
          puts "\n\nNúmero de oportunidades: #{oportunidades}"
          puts "----------------------------------------------------------"
          puts "Definición: #{i}"
          puts "----------------------------------------------------------"
          puts "Adivina:"
          break if gets.chomp == @answers[j]
          oportunidades -= 1
        end

        if oportunidades == 0
          puts "\nGracias por participar!"
          break #Gets out from the asking loop
        end

        puts "\nQuedan #{@questions.length - 1 - j} definiciones... Ánimo" if j < 7
        puts "\nQuedan #{@questions.length - 1 - j} definiciones... Vamos!!!" if j >= 7

        puts "\nTe salvaste! Pilas!\n" if oportunidades == 1
        puts "\nBien!\n" if oportunidades == 2
        puts "\nExcelente respuesta!\n" if oportunidades == 3

        puts "\nBien jugado señor!\n" if @questions.length == j + 1

    end
  end
end


new_game = Reto5.new('qa.txt')  #Instancio la clase Reto5 en el objeto new_game.
new_game.preguntar  #Llamo al método pregntar para iniciar el juego



