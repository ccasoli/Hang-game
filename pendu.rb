#ecran d affichage pour choisir difficulte
def welcome
    puts "  si tu as l erreur : "
    puts "  invalid byte sequence in UTF-8"
    puts "relance le program jusqu a ne plus l avoir"
    puts ""
    puts "  -------Bienvenue dans mon jeu du pendu------"
    puts " |                                            "
    puts " | Choisi une difficulté :                    "
    puts " |                                            "
    puts " | 1 -> facile                                "
    puts " | 2 -> moyen                                 "
    puts " | 3 -> difficile                             "
    puts " |                                            "
end

#return la difficulte, oblig a choisir 1 2 3  
def difficulty
    print " | -> "
    dif = gets.chomp.to_i
    while dif < 1 || dif > 3
        puts " |"
        puts "  ----------Choisi une difficulté : ----------"
        puts " |                                            "
        puts " | 1 -> facile                                "
        puts " | 2 -> moyen                                 "
        puts " | 3 -> difficile                             "
        puts " |                                            "
        print " | -> "
        puts " |                                            "
        dif = gets.chomp.to_i
    end
    return dif
end

# return le mot en fonction de la difficulte
def word
    dif = difficulty
    w = pick_word
    if dif == 1
        puts "  ----------------mot facile : ---------------"
        while size_word(w) >= 7
            w = pick_word
        end
        puts " |                                            "
        puts " | -> ton mot a #{size_word(w)} lettres       "
        return w
    elsif dif == 2
        puts "  ----------------mot moyen : ----------------"
        while size_word(w) == 7 && size_word(w) == 8 
            w = pick_word
        end
        puts " |                                            "
        puts " | -> ton mot a #{size_word(w)} lettres       "
        return w
    else 
        puts "  ----------------mot difficile : ------------"
        while size_word(w) <= 9
            w = pick_word
        end
        puts " |                                            "
        puts " | -> ton mot a #{size_word(w)} lettres       "
    end
end

#choisie un mot random parmis la liste 
def pick_word
    r = rand(1..22740)
    list = []
    fic =File.new("liste_francais.txt",'r')
    fic.each_line do |i|
        list.push(i)
    end
    return list[r].strip!
end

# nombre de lettre de mon mot -2 car 2 espace on ete ajouter au dossier
def size_word(w)
    ws = w.size 
    return ws
end

# recupere le mot de la liste from pick_word
#affiche le nombre de lettre et les vides
def try_word(w)
    try = 10
    the_w = w
    i = 0
    print the_w
    empty_word = []
    size_word(the_w).times do |i|
        empty_word << "-"
    end
    input = input_letter
    while try >= 1
        while size_word(the_w) > i
            if the_w[i] == input 
                empty_word[i] = the_w[i]
                puts " |"
                puts " | #{try} -> #{empty_word.join}"
                puts " | "
                input = input_letter
            else 
                i+=1
            end
        end
        if !(empty_word.include?('-'))
            puts " |"
            puts " | gagner "
            puts " |"
            play_again
        end
        try-=1
        i=0
        puts " |"
        puts " | #{try} -> #{empty_word.join}"
        puts " | "
        input = input_letter
    end
    puts " |"
    puts " | fini"
    puts " |"
    play_again

end

#rentrer une lettre
def input_letter
    print " | -> "
    input = gets.chomp.to_s
    return input
end

#lance la martie
def play
    welcome
    try_word(word)
end

#demande au joueur si il veut rejouer
def play_again
    puts " | tu veux rejouer ? o/n "
    puts " | "
    print " | -> "
    p = gets.chomp
    while p != "o" || p != "n"
        if p == "o"
            play
        else
            puts "      by      "
            break
        end
        puts " | "
        puts " | press o ou n "
        puts " | "
        print " | -> "
        p = gets.chomp.to_s
    end
end

play