//
//  ScenarioProrerty.swift
//  DefeatAlgebra
//
//  Created by yo hanashima on 2018/08/12.
//  Copyright © 2018 yo hanashima. All rights reserved.
//

import Foundation

// 0: good scientist, 1: mad scientist, 2: main hero

struct ScenarioProperty {
    static let scenario0: [[String]] = [
        ["2", "はっ！ ふっ！ はっ！ はっ！ ふっ！"],
        ["0", "ほっほっほ\n精がでるなエックスよ"],
        ["2", "あ、アルジェ博士！"],
        ["0", "訓練も大事だが\n勉強もサボるんじゃないぞ！"],
        ["2", "はいはい、わかってますよ\n（あんなのやっても意味ないだろ・・）"],
        ["pause"],
        ["2", "な、なんだ！？"],
        ["1", "はっはっはっ\n久しぶりだなアルジェ博士よ"],
        ["0", "お前はジェブラ博士！"],
        ["2", "知り合い\nなんですか！？"],
        ["0", "うむ・・。奴はわしの元弟子じゃ"],
        ["0", "しかし、危険な研究ばかりするゆえ破門にしたのじゃ・・"],
        ["1", "ははは、嘘をつけ！\n私の才能に嫉妬して追い出したんだろう！"],
        ["0", "ばかをいえ・・・\n今ごろ何をしに来たんじゃ！"],
        ["1", "ふふふ。愚かな元師匠に私の研究の素晴らしさを教えてやろうと思ってな！"],
        ["1", "ゆけっ！我がロボット達よ！！奴らの町を破壊するのだ！"],
        ["pause"],
        ["2", "なんだこいつは！？"],
        ["0", "どうやら、あやつが作り出した兵器のようじゃの"],
        ["2", "町を破壊するって言ってたぞ！なんとかしないと！！"],
        ["0", "わしが奴のロボットを分析するゆえ、時間を稼いでくれ！"],
        ["2", "時間を稼げって言われても、どうすりゃいいんだ・・"],
        ["pause"],
        ["2", "なんだ！？何か丸いものをロボットに送ってるぞ"],
        ["2", "うわっ！腕が伸びた！あれに当たったらヤバそうだ"]
    ]
    
    static let scenarioUncoverSignal: [[String]] = [
        ["2", "よし！やっつけたぞ！"],
        ["1", "ふっふっふ、面白くなるのはまだまだこれからだぞ"],
        ["pause"],
        ["2", "うわ！また出てきた！"],
        ["0", "待たせたなエックスよ分析ができたぞ！"],
        ["2", "本当ですか！？博士！"],
        ["0", "うむ。このロボットは「暗号」を持っておることがわかった"],
        ["2", "暗号？"],
        ["0", "これがわしが解読した暗号じゃ！"],
        ["pause"],
        ["2", "なんかxとか数字が書いてあるな"],
        ["0", "そして、ジェブラから時々ロボットに何か送られていただろう？"],
        ["2", "そうそう！なんか赤い丸いのが送られてた！"],
        ["0", "あれは「信号」じゃ！"],
        ["2", "信号？"],
        ["0", "そうじゃ。わしの解読によると、ロボットに「xに入る数」を送っている"],
        ["pause"],
        ["0", "この信号を解読すると"],
        ["pause"],
        ["2", "あ！２って書かれてる"],
        ["0", "そうじゃ、そしてこの信号をロボットが受け取ると"],
        ["pause"],
        ["2", "「x＝２」が表示された！"],
        ["0", "信号とxの関係については解読できたのじゃが・・"],
        ["0", "暗号についてはまだ分析中じゃ"],
        ["2", "えーーー、一番肝心なところが分からないのかよ"],
        ["0", "ただ、信号を受け取った時だけ攻撃してくるのは間違いないぞ"],
        ["2", "確かに、通常時は１マスしか移動しないな"],
        ["2", "しょうがない！なんとかするしかないか！"],
        ["pause"]
    ]
    
    static let scenarioChangeMoveSpan: [[String]] = [
        ["2", "よし！なんとかやっつけたぞ！"],
        ["1", "ははは、我がロボットの恐ろしさはまだまだ序の口だぞ"],
        ["2", "な、何だって！？"],
        ["0", "すまん、暗号の解読にはまだもう少し時間がかかりそうじゃ・・"],
        ["0", "じゃが、靴を改良したぞ！これで移動範囲が広がったはずじゃ"],
        ["0", "あと少し耐え抜いてくれ！エックスよ！"],
        ["2", "わかった博士！でもなるべく急いでくれよ！"],
        ["pause"]
    ]
    
    static let scenarioTimeBombStartTurn: [[String]] = [
        ["2", "くそお。次から次へとどんどん来やがる"],
        ["0", "暗号の解読に成功したぞ！！"],
        ["2", "ホントですか博士！！"],
        ["0", "うむ！\nあの暗号は「文字式」だったんじゃ！"],
        ["2", "文字式？なんか学校の授業で聞いたことある気がする・・"],
        ["0", "その文字式じゃ！"],
        ["2", "なるほど！・・って何だっけ？笑"],
        ["0", "全く・・。だから勉強も怠るなと行っておろうに・・"],
        ["2", "お説教は後にして！\nほら敵がきちゃうよ！"],
        ["0", "しょうがない・・。\n説教はあやつを追い返してからじゃな"],
        ["0", "文字式は、文字に数が入り計算されるのじゃ"], //10
        ["pause"],
        ["0", "この敵を見てみよう"],
        ["0", "このロボットは\nx＋１を持っておるな"],
        ["0", "このロボットに\nx＝２の信号が送られると"],
        ["pause"],
        ["0", "xを２としてx＋１が計算されるのじゃ"],
        ["2", "つまり、２＋１で３\nってこと？"],
        ["pause"],
        ["0", "その通りじゃ！そしてその３が攻撃のパンチの長さとなるのじゃ！"],
        ["0", "じゃからこの敵は、次のターン３マスだけパンチしてくる"], //20
        ["pause"],
        ["2", "なるほど！それがこの暗号の意味か！"],
        ["0", "うむ！敵の暗号を解読した今、これはチャンスじゃ！"],
        ["2", "チャンス？"],
        ["0", "そうじゃ！わしの開発した爆弾を使えば敵を効率よく倒せるぞ！"],
        ["pause"],
        ["0", "アイテムボタンをタッチしてくれ"],
        ["0", "次に爆弾アイコンをタッチしてくれ"],
        ["0", "紫のエリアに爆弾を仕掛けられるぞ"],
        ["0", "今信号はx＝１だからこの敵は２マス先までパンチしてくる"],
        ["0", "じゃから、敵がやってくるここに爆弾を仕掛けるんじゃ！"], //30
        ["2", "おお！敵を爆破した！"],
        ["0", "他の敵も爆弾を使って倒してみよう！"],
        ["pause"],
        ["0", "よくやった！爆弾を使えば離れている敵も倒せるぞ！"],
        ["2", "うん！これで敵をじゃんじゃん倒してやる！"],
        ["pause"]
    ]
    
    static let scenarioUnsimplified: [[String]] = [
        ["1", "どうやら、我がロボットの暗号の謎を解いたようだな"],
        ["2", "へっ！余裕のよっちゃんよ！あんたの研究も大した事ないんだな"],
        ["1", "ふっ。今のうちに粋がっておるがよい"],
        ["1", "どれ、もっと複雑な暗号にしてやろう！"],
        ["2", "ふんっ！見た目が少し変わったって、仕組みは一緒さ！"],
        ["pause"]
    ]
    
    static let scenarioEqRobStartTurn: [[String]] = [
        ["2", "暗号が複雑になってきて、めんどくさいな"],
        ["0", "エックスよ！一見違うように見えても、同じ暗号があることに気づいたか？"],
        ["2", "アルジェ博士！どういうことですか？"],
        ["pause"],
        ["0", "例えばこの敵の持つ暗号は、同じなのがわかるかな？"],
        ["2", "ん？\n同じなの？"],
        ["0", "そうなのじゃ！\nシミュレーターで確かめてみよう！"],
        ["pause"],
        ["0", "xに入る数を自由に選択するのじゃ！"],
        ["0", "緑色の部分が敵の攻撃してくる長さじゃ"],
        ["0", "どうじゃ？xがいくつでも、ロボットが攻撃してくる長さが変わらないことがわかったかな？"],
        ["2", "うん。でもどうして？"], //10
        ["0", "暗号の文字式を計算して見るのじゃ"],
        ["pause"],
        ["0", "x＝１の時、この敵の攻撃してくる長さは\n３じゃな"],
        ["0", "次にこの敵は\nこちらも攻撃してくる長さは３じゃな"],
        ["0", "x＝２の時はどうじゃこの敵の攻撃してくる長さは５じゃな"],
        ["0", "こちらの敵も、攻撃してくる長さは５じゃな"],
        ["2", "いつも同じだ！!"],
        ["0", "２x＋１もx＋１＋xも、２つのxと１の合計なわけじゃから"],
        ["0", "xに入る数がいくつでも計算結果は同じなんじゃな"],
        ["2", "なるほど！xに何が入っても同じ計算結果になるのが同じ暗号ってことか！"], //20
        ["0", "その通りじゃ！"],
        ["2", "・・・。でも、それが分かったからってなんか意味ある？"],
        ["0", "おおそうじゃった！\nここからが本題じゃ！"],
        ["pause"],
        ["0", "敵を一気に倒せる新しいマシーンを開発したぞ！"],
        ["2", "一気に倒せる！？\n一体どんなマシーン何ですか！"],
        ["0", "うむ。その名も\nエクロボじゃ！"],
        ["pause"],
        ["2", "エ、エクロボ？\n（名前ださいな・・）"],
        ["2", "それで、どうやって奴らを倒すんですか？"], //30
        ["0", "このエクロボは同じ暗号の敵を倒せるのじゃ"],
        ["0", "実際に使ってみるのがはやいじゃろう！"],
        ["pause"],
        ["0", "エクロボをタッチするのじゃ"],
        ["0", "この敵と同じ２x＋１を入力してみるのじゃ"],
        ["0", "次に、２x＋１と同じ暗号を持つ敵をタッチするのじゃ"],
        ["0", "これで、エクロボはそのロボットをロックオンしたぞ"],
        ["0", "他に２x＋１と\n同じ暗号を持つ敵はどれかな？"],
        ["pause"], //40
        ["2", "x＋１＋xは２x＋１と同じだね！"],
        ["0", "そうじゃな、その敵もタッチするのじゃ！"],
        ["2", "他のロボットはどうだろう？"],
        ["0", "同じように考えてみるのじゃ。\n同じ暗号だと思ったら"],
        ["0", "その敵をタッチしてロックオンじゃ！"],
        ["0", "最後にエクロボ自身をタッチすると攻撃を始めるぞ！"],
        ["pause"],
        ["0", "パーフェクトじゃ！！"],
        ["2", "すげー！一気に4体もやっつけたぞ！！"],
        ["0", "その調子でうまくエクロボを使って、敵を倒すのじゃ！"], //50
        ["2", "よーし！\nこれで百人力だ！"], // clear
        ["pause"],
        ["0", "xに何が入っても同じ計算結果になる文字式は同じもの"], // miss
        ["0", "これをしっかり頭に入れておくのじゃ！"],
        ["2", "結局、攻撃してくる長さは同じだもんね"],
        ["0", "その通りじゃ！\nうまくエクロボを使い敵を倒すのじゃ！"],
        ["2", "よーし！\nこれで百人力だ！"],
        ["pause"]
    ]
    
    static let scenarioCannonStartTurn: [[String]] = [
        ["0", "すまぬ、エクロボはしばらく充電しなければならないようじゃ"],
        ["2", "えー！またですか！？"],
        ["0", "じゃが、新たにアルジェ砲を開発したぞ！！"],
        ["2", "アルジェ砲！？"],
        ["0", "アルジェ砲は、攻撃モードのロボットが前後にいる時"],
        ["0", "飛距離を入力して\n砲撃することができるのじゃ！"],
        ["pause"],
        ["0", "このアルジェ砲をタッチするのじゃ"],
        ["0", "これで砲撃の飛距離を入力できるぞ"],
        ["0", "今、前の敵はどこまで攻撃してくる？"],
        ["2", "２＋２で４マス分だね"],
        ["0", "そうじゃな。じゃから、それに当たるように飛距離を６にセットするのじゃ"],
        ["0", "飛距離６がこのアルジェ砲にセットされたぞ"],
        ["0", "次のターンに砲撃されるぞ！"],
        ["pause"],
        ["2", "やった、撃破した！"],
        ["0", "砲撃が当たると、敵を破壊することができるぞ！"],
        ["2", "敵に当たるようにうまく砲撃の飛距離を入力すればいいんだな！"],
        ["0", "そうじゃ！\nもう片方の敵もアルジェ砲を使って倒してみるのじゃ！"],
        ["pause"]
    ]
    
    static let scenarioInvisibleStartTurn: [[String]] = [
        ["2", "どうやら、俺たちを甘く見ていたようだな！"],
        ["0", "ジェブラ博士よ。\nバカなことはやめて\nもっと人のためになる研究をしたらどうじゃ"],
        ["1", "ふっふっふ。甘く見ているのはどちらかな？"],
        ["pause"],
        ["2", "うわっ！信号の中身がわからなくなってる！"],
        ["0", "なんじゃと！？"],
        ["1", "はっはっは。アルジェよ、お前の解読はもう通用せんぞ！！"],
        ["2", "くそっ！これじゃロボットがどこまで攻撃してくるかわからない！！"],
        ["0", "くっ！やつめ、わしが解読できないようにブロックしておる"],
        ["2", "どうすれば\nいいんだよ〜"],
        ["0", "あきらめるのはまだ早いぞ！"],
        ["0", "こんなこともあろうかと、アルジェ砲を改良しておいたのじゃ！"],
        ["2", "さすが博士！\nでも何ができるようになったの？"],
        ["0", "敵の信号をジャックして砲撃できるようになったのじゃ！"],
        ["2", "どうゆうこと？"],
        ["0", "使って見るのが早かろう！"],
        ["pause"],
        ["0", "このアルジェブラ砲をタッチするのじゃ！"],
        ["0", "新たに「x」を入力できるようになったのがわかるかな"],
        ["2", "ホントだ！飛距離にxを入力できるようになったってこと？"],
        ["0", "その通りじゃ！"],
        ["pause"],
        ["0", "試しにxを入力してみよう"],
        ["0", "さらに、試し撃ち機能も追加したぞ！"],
        ["0", "ためすボタンを押すのじゃ！"],
        ["0", "まずは、x＝１だったらどうなるかみてみよう"],
        ["0", "砲撃が1マスだけ飛んだのがわかったかな"],
        ["0", "このように、xに入る数に応じた飛距離を入力できるのじゃ"],
        ["2", "なんだか、敵のロボットの暗号みたいだね！"],
        ["0", "その通りじゃ！仕組みは同じじゃからな"],
        ["2", "でも、敵に砲撃が当たってないよ"],
        ["pause"],
        ["0", "そうじゃな・・・。\nx＝２の場合はどうじゃろう"],
        ["0", "これも当らない・・。しかし、砲撃と敵との距離はさっきと同じだな"],
        ["0", "試し撃ちした記録はボードにたまっていくぞ"],
        ["pause"],
        ["0", "x＝３の場合も試してみよう"],
        ["0", "これも当らないな"],
        ["0", "記録を見てみよう"],
        ["pause"],
        ["0", "敵の攻撃の長さとアルジェ砲の飛距離は常に一緒じゃな"],
        ["pause"],
        ["0", "砲撃と敵との距離も常に２のようじゃのう"],
        ["2", "これは、何か関係がありそうですね"],
        ["0", "そうじゃな・・・。\n砲撃の飛距離を変えてみよう"],
        ["pause"],
        ["0", "このボタンをタッチするのじゃ"],
        ["0", "砲撃と敵との距離が常に２のようじゃから\nx＋２を入力してみよう"],
        ["0", "もう一度xに数を入れて、試し撃ちして見るのじゃ"],
        ["0", "おお！砲撃が当たったのう！他のxの数でも試してみるのじゃ！"],
        ["0", "またジャストミートじゃ！"],
        ["0", "これも当たりじゃ！"],
        ["0", "飛距離にx＋２を入力すれば、必ず砲撃が当たることがわかったのう！！"],
        ["pause"],
        ["0", "やめるボタンをタッチして、試し撃ちを終了しよう"],
        ["0", "アルジェ砲が敵の持つ信号を受信したぞ！"],
        ["pause"],
        ["2", "やった！\n敵を倒せたぞ！"],
        ["0", "試し撃ちで、xに何が入っても砲撃が当たるのを確認したからの！"],
        ["0", "信号の中身がわからなくても、改良したアルジェ砲を上手く使えば敵を倒せるはずじゃ！"],
        ["2", "試し撃ちを使いながら確実に倒せる飛距離を見つければいいんだね"],
        ["0", "その通りじゃ！敵も残り少ないはず！\n任せたぞエックスよ！"],
        ["2", "合点承知！！"],
        ["pause"]
    ]
    
    static let scenarioLastTurn: [[String]] = [
        ["1", "ぐぬぬ！！\n小癪な奴らめ！！！"],
        ["2", "俺とアルジェ博士にかかればこんなものよ！"],
        ["0", "ジェブラよ\nもう諦めて心を入れ替えるのじゃ"],
        ["1", "ええい！うるさい！"],
        ["1", "私の研究がお前らなんかに遅れをとるはずないんだ！"],
        ["0", "ジェブラよ・・・。"],
        ["1", "全勢力を持ってお前たちを叩き潰してやる！"],
        ["0", "エックスよ。おそらくこれが奴の最後の攻撃じゃ"],
        ["0", "町に平和を取り戻してくれ！"],
        ["2", "まかせて！博士！"],
        ["2", "この町は絶対に守り抜く！！"],
        ["pause"]
    ]
}
