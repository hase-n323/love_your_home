# README

## サービス概要
床や壁クロスのカラーを簡単にシミュレーションできるサービスです。ユーザーは自分の部屋に合った色やデザインを試すことができます。

## このサービスへの思い・作りたい理由
部屋の雰囲気を少し変えるだけで、生活がより快適になります。賃貸でもセルフリノベーションで床やクロスを変更できることを知ってもらいたいと思っています。

私自身、オーソドックスなフローリングカラーの賃貸に住んでいましたが、ホワイト×グレーのインテリアにしたいという夢がありました。しかし、ホワイト系の賃貸は新築が多く、家賃も高いため諦めていました。職場の方からセルフリノベーションの方法を教わり、ネットで材料を購入して実行したところ、自分のイメージ通りのインテリアを実現することができました。その結果、自宅で過ごす時間がとても素敵になりました。

このアプリは、同じように賃貸でも自分の思うように内装を変えたいと考えている人に届けたいという思いで作成したいと思いました。

## ユーザー層について
- 引越しのタイミングの人
- 部屋の模様替えをしたい人
- ペットを飼っていて床・クロスの傷が気になる人
- 家にマンネリ化を感じてる人

## サービスの利用イメージ
- ユーザーはスマホやPCを使用してどこにいても情報を検索することができます。
- 例えば床は今のままで壁紙だけ一部変えたい時は床カラーを今の色に近いものを選択し、壁紙を色々なカラーを選択して似合うカラーを見つけることが出来る。(シュミレーションページ)
- 今後変更予定のクロスや床があった場合、家具や小物を選ぶ際にカラーや配置などをイメージしやすいです。


## ユーザーの獲得について
- SNS上でインテリア・リノベーション・リフォーム・DIYに関する情報を検索し、Xなどで流れてくる情報を通じてこのアプリを知るきっかけになります。

## サービスの差別化ポイント・推しポイント
- 全部の材料を提案するのではなくセルフで施工可能な材料を選択できるようなところ
- クロス範囲は1面のアクセントクロスで現実的に提案する。
- シュミレーションで広い間取りではなく現実的な間取りでよりイメージしやすい


## 機能候補
  ### MVP
  - 会員登録
  - ログイン
  - お気に入り
  - シュミレーション【mainpage】

  ### その後の機能
  - 関連動画（youtube）表示
  - twitterシェアボタンの設置
  - 楽天API


## 機能の実装方針予定
- mainpageでイメージシュミレーションにはThree.jsを使ってみたいと考えています。
- 可能であれば楽天APIを使ってシュミレーションに関連する素材を表示するように出来たらと思っています。

### 参考
https://ss.sangetsu.co.jp/LD1_vintage/

## 画面遷移図
Figma：https://www.figma.com/design/DxExmpwSC8UGBsqDwU7Wpa/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=3jjMGAuGUZJXpFxU-0

## ER図

```mermaid
erDiagram
    users ||--o{ interior_images : "ユーザーは複数のインテリアイメージを作成できる"
    users ||--o{ bookmarks : "ユーザーは複数のブックマークを作成できる"
    bookmarks ||--|| interior_images : "ブックマークは一つのインテリアイメージを持つ"
    interior_images ||--o{ floors : "インテリアイメージは複数の床を持つことができる"
    interior_images ||--o{ wallpapers : "インテリアイメージは複数の壁紙を持つことができる"

    users {
      bigint id PK
      string name "ユーザー名"
      string email "メールアドレス"
      string crypted_password "暗号化パスワード"
      timestamp created_at "作成日"
      timestamp updated_at "更新日"
    }
    interior_images {
      bigint id PK "イメージ画像ID"
      bigint user_id FK "ユーザーID"
      bigint floor_id FK "床ID"
      bigint wallpaper_id FK "クロスID"
      timestamp created_at "作成日"
      timestamp updated_at "更新日"
    }
    floors {
      bigint id PK "床ID"
      string name "床品番"
      timestamp created_at "作成日"
      timestamp updated_at "更新日"
    }
    wallpapers {
      bigint id PK "クロスID"
      string name "クロス品番"
      timestamp created_at "作成日"
      timestamp updated_at "更新日"
    }
    bookmarks {
      bigint id PK "ブックマークID"
      bigint user_id FK "ユーザーID"
      bigint interior_image_id FK "イメージ画像ID"
      timestamp created_at "作成日"
      timestamp updated_at "更新日"
    }
