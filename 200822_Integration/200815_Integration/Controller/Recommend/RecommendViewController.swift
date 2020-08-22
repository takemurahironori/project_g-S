

import UIKit
import Gemini

class RecommendViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let photos = ["01", "02", "03", "04", "05"]

    @IBOutlet weak var collectionView: GeminiCollectionView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            collectionView.dataSource = self
            collectionView.delegate = self
            
            // Configure the animation
            collectionView.gemini
            .scaleAnimation()
            .scale(0.3)
            .scaleEffect(.scaleUp) // or .scaleDown
            
                    }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return photos.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemCell", for: indexPath) as! MyCell
            
            cell.setCell(imageName: photos[indexPath.row])
            
            // Animate
            self.collectionView.animateCell(cell)
            
            return cell
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            // Animate
            self.collectionView.animateVisibleCells()
        }
        
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            
            // Animate
            if let cell = cell as? MyCell {
                self.collectionView.animateCell(cell)
            }
            
        }
        
        //collectionview中のセルをタップしたかどうかを検知する
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              print("Cellがタップされた！")
                  let dialog = UIAlertController(title: "今月お届けするウイスキー", message: "このウイスキーで良いですか？", preferredStyle: .alert)
                          // 選択肢(ボタン)を2つ(OKとCancel)追加します
                          //   titleには、選択肢として表示される文字列を指定します
                          //styleには、通常は「.default」、キャンセルなど操作を無効にするものは「.cancel」、削除など注意して選択すべきものは「.destructive」を指定します
                          dialog.addAction(UIAlertAction(title: "飲んでみたい！", style: .default, handler: nil))
                         dialog.addAction(UIAlertAction(title: "このウイスキーを知りたい！", style: .default, handler: nil))
                          
                         dialog.addAction(UIAlertAction(title: "もう少し悩みます。", style: .cancel, handler: nil))
                          // 生成したダイアログを実際に表示します
                          self.present(dialog, animated: true, completion: nil)
            
        }

    }


