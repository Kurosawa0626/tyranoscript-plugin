;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]
[showmenubutton]

[bg storage="room.jpg" time="100"]

;メッセージウィンドウの設定
[position layer="message0" left=20 top=400 width=920 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=true

[ptext name="chara_name_area" layer="message0" color="white" size=24 x=50 y=410]
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
[chara_new  name="akane" storage="chara/akane/normal.png" jname="あかね"  ]
[chara_new  name="yamato" storage="chara/yamato/normal.png" jname="やまと"  ]


;キャラクター登場
[chara_show name="akane"]
[chara_show name="yamato" top=0px]

*selectplugin

見たいプラグインを選択してください。[p]

[glink  color="blue"  storage="scene1.ks"  size="20"  x="260"  width="400"  y="100"  text="シェイク"  target="*quake"]
[s]

;シェイクプラグイン
*quake
[QuakeKrswStart hmax=20 time=3000 accel=-3]
全縦揺れ[p]
[QuakeKrswFinish]

[QuakeKrswStart wmax=20 time=3000 accel=-3]
全横揺れ[p]
[QuakeKrswFinish]

[QuakeKrswStart layer=0 hmax=20 time=3000 accel=-3]
レイヤー縦揺れ[p]
[QuakeKrswFinish layer=0]

[QuakeKrswStart layer=0 wmax=20 time=3000 accel=-3]
レイヤー横揺れ[p]
[QuakeKrswFinish layer=0]

[QuakeKrswStart name=akane hmax=20 time=3000 accel=-3]
名前縦揺れ[p]
[QuakeKrswFinish name=akane]

[QuakeKrswStart name=yamato wmax=20 time=3000 accel=-3]
名前横揺れ[p]
[QuakeKrswFinish name=yamato]

[call target="selectplugin"]