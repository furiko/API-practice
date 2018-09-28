##progress1

####コールバック処理
今回GitHubのAPIを叩くに当たって使ったURLsessionのdataTaskメソッドのクロージャがコールバック処理の実装を担っていると思います.正直サンプルを丸写しなので理解はあまりできていない.今回色々と非同期通信でつまづいたのでその際に調べて得たクロージャの知識や,dataTaskメソッド内のクロージャ内で定義しているdata,response,errorあたりは理解しているはずです.

####デリゲート
正直デリゲートはほとんど理解できていなくて,今の所自分の中でのデリゲートの認識はSwiftなどのプログラミング言語側からプログラマが必要としていそうなメソッドを提供してくれるものといった感じになってしまっています.そのため,今回のコードでは全く意識できていないです.

####MVC(MVCP)
MVCの認識はそれぞれ,Modelが外部とのやり取りの結果などを保存する役割,Viewが画面の表示,ControllerがViewとModelのやり取りの仲介役という感じでした.それに基づいて今回はViewController(View),ResultViewController(View),ViewGHAPIController(Controller),GHAPIModelの4つのファイルを作成しました.また,Presenterは複数Controllerがある場合に共通部分を抽出して1つのファイルにし,Controllerのコード行数を減らす役割だと思っていたので考えてません.