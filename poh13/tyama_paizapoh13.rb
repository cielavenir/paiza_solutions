#!/usr/bin/ruby
#paizajack program by @cielavenir.

def score(cards)
	a,b=cards.partition{|e|e==1}
	(a.size+1).times.map{|i|
		10*i+a.size+b.reduce(0,:+)
	}.select{|e|e<=21}.max
end

cards_s=gets
match_s=gets
streak_s=gets
won_s=gets
dealer_s=gets
deck_s=gets

cards=cards_s.split.map &:to_i
if cards[0]==0
	#take care of combo?
	if streak_s.to_i==0
		puts 10000 #cards[1]
	else
		puts (0.4 * won_s.to_i).to_i
	end
	exit
end

if score(cards).nil? || score(cards)==21
	#決着
	#todo:dealerも21になったら負けなので、bustさせるためにあえて引く場合
	puts 'STAND'
	exit
end

if !dealer_s
	#緑川つばめまで
	if cards.reduce(:+)>=16 || score(cards)>=18
		puts 'STAND'
	else
		puts 'HIT'
	end
elsif !deck_s
	#緑川つばめバニーまで
	dealer=dealer_s.split.map &:to_i
	if score(dealer).nil? || score(dealer)==21
		#決着
		puts 'STAND'
	elsif score(cards)>score(dealer)
		#todo: 余裕があるのにスタンドしうる
		puts 'STAND'
	else
		puts 'HIT'
	end
else
	#六村リオ赤バニーまで
	dealer=dealer_s.split.map &:to_i
	deck=deck_s.split.map &:to_i
	dealer_freeze=cards.size>dealer.size 
	
	if score(dealer).nil? || score(dealer)==21
		#決着
		puts 'STAND'
	elsif dealer_freeze
		#勝つまで引ける
		if score(cards)>score(dealer)
			puts 'STAND'
		else
			puts 'HIT'
		end
	elsif score(cards+[deck[0]]).nil? && score(cards+[deck[1]||99]).nil?
		#詰み
		puts 'STAND'
	elsif score(cards+[deck[0]])&&score(cards+[deck[1]||0])
		#引いて差し支えない
		if score(cards)<=[score(cards+[deck[0]]),score(cards+[deck[1]||0])].max
			puts 'HIT'
		else
			#けど、引かないほうがスコアが高くなるなぁ
			puts 'STAND'
		end
	# 1枚目か2枚目のどちらかは手札に加えて安全…さて、どう出るか。
	elsif score(dealer+[deck[0]]).nil?
		# ディーラーがbustするなら1枚目を引くことになりそうだよね
		if score(cards+[deck[0]]) && score(cards)<=score(cards+[deck[0]])
			puts 'HIT'
		else
			puts 'STAND'
		end
	elsif deck.size<2
		puts 'STAND'
	elsif score(cards+[deck[1]]) && score(dealer+[deck[0]]) && score(dealer+[deck[0]])>=score(cards)
		puts 'HIT'
	else
		puts 'STAND'
	end
end
