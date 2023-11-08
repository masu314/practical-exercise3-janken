# じゃんけんの処理
def janken
  jankens = ["グー","チョキ","パー","戦わない"]
  puts "0（グー）1（チョキ）2（パー）3（戦わない）"
  input_number = gets.chomp.to_i
  
  if  input_number == 0 || input_number == 1 || input_number == 2
    player_hand = jankens[input_number]
    program_hand = jankens[rand(3)]
    
    puts "ホイ！"
    puts "---------------"
    puts "あなた:#{player_hand}を出しました"
    puts "相手：#{program_hand}を出しました"
    
    # 勝った場合
    if (player_hand == "グー" && program_hand == "チョキ") || (player_hand == "チョキ" && program_hand == "パー") || (player_hand == "パー" && program_hand == "グー")
      return "win"
    # あいこだった場合
    elsif player_hand == program_hand
      return "draw"
    # 負けた場合
    else
      return "lose"
    end
    
  elsif input_number == 3
    puts "じゃんけんが放棄されました"
    return "exit"
  else
    puts "0~3の数字を入力してください"
    return "re_enter"
  end
  
end


# あっち向いてホイの処理
def acchimuite_hoi
  directions = ["上","下","左","右"]
  puts "0（上）1（下）2（左）3（右）"
  input_number = gets.chomp.to_i
  
  if input_number == 0 || input_number == 1 || input_number == 2 || input_number == 3
    player_direction = directions[input_number]
    program_direction = directions[rand(4)]
    
    puts "ホイ！"
    puts "---------------"
    puts "あなた:#{player_direction}"
    puts "相手：#{program_direction}"
    
    # 方向が一致した場合
    if player_direction == program_direction
      return "match"
    # 方向が一致しなかった場合
    else
      return "mismatch"
    end
    
  else
    puts "0~3の数字を入力してください"
    return "re_enter"
  end
  
end


# じゃんけんの勝敗
janken_judge = nil
# あっち向いてホイの勝敗
hoi_judge = nil
# 全体の勝敗
judge = false

# 勝敗がついていない限りループ
while !judge
  if janken_judge == "re_enter" || janken_judge == nil
    puts "じゃんけん..."
    janken_judge = janken
  elsif janken_judge == "draw"
    puts "あいこで..."
    janken_judge = janken
  elsif janken_judge == "exit"
    break
  else
    
    # 不正入力の場合ループ（それ以外の場合はbreakで処理を抜ける）
    while true
      puts "あっち向いて~"
      hoi_judge = acchimuite_hoi
      
      if janken_judge == "win" && hoi_judge == "match"
        puts "あなたの勝ちです"
        judge = true
        break
      elsif janken_judge == "lose" && hoi_judge == "match"
        puts "あなたの負けです"
        judge = true
        break
      elsif hoi_judge == "mismatch"
        janken_judge = nil
        break
      else
      end
    end
    
  end
end