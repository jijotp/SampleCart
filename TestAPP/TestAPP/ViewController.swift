//
//  ViewController.swift
//  TestAPP
//
//  Created by Arjun on 29/01/21.
//

import UIKit
import AVFoundation
import GoSwiftyM3U8
import Alamofire
import Alamofire_Synchronous

class ViewController: UIViewController,AVPlayerItemMetadataOutputPushDelegate,UITextViewDelegate ,UITextFieldDelegate{
    
    var player = AVAudioPlayer()
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var txt6: UITextField!
  
    @IBOutlet weak var texteldOne: UITextField!
    @IBOutlet weak var textFeildTwo: UITextField!
    @IBOutlet weak var txt5: UITextField!
    @IBOutlet weak var textLabel: UITextView!
    
    @IBOutlet weak var heightScreen: NSLayoutConstraint!
    @IBOutlet weak var plyaerView: UIView!
    var screenSize = UIScreen.main.bounds
    var playerLayer = AVPlayerLayer()
    var liveString: String?
    var isHappend = false
    let landScapeaLyout = UICollectionViewFlowLayout()
    let potrarScapeaLyout = UICollectionViewFlowLayout()
    @IBOutlet weak var happYView: UIView!{
        didSet{
            self.happYView.alpha = 0
        }
    }
    var isselected = false
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    var cellSizePortait = CGSize(width:0 ,height:0)
    var cellSizeLandscape = CGSize(width:0 ,height:0)
    var Player: AVPlayer!
    var PlayerItem: AVPlayerItem!
    var style:UIStatusBarStyle = .default
    var syncAButtonNumber = 0
    var syncButtonNumber = 0
    
    @IBOutlet weak var customeView: UIView!
    @IBOutlet weak var searchMainBarView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    @IBAction func syncAction(_ sender: Any) {
       let responce = Alamofire.request("https://stghybrisin.lulumea.com/lulucommercewebservices/v2/lulu-in/products/search?&query=%3Adiscount-desc%3Acategory%3AHY00214914&fields=FULL&pageSize=50&searchQueryContext=SUGGESTIONS&sort=discount-desc&currentPage=0").responseJSON()
        if let json = responce.result.value {
            print(json)
            self.syncButtonNumber += 1
            print("asyncNumber",self.syncButtonNumber)
            print(Date())
        }
        
        let responce1 = Alamofire.request("https://stghybrisin.lulumea.com/lulucommercewebservices/v2/lulu-in/products/search?&query=%3Adiscount-desc%3Acategory%3AHY00214914&fields=FULL&pageSize=50&searchQueryContext=SUGGESTIONS&sort=discount-desc&currentPage=0").responseJSON()
         if let json = responce1.result.value {
             print(json)
             self.syncButtonNumber += 1
             print("asyncNumber",self.syncButtonNumber)
             print(Date())
         }
    }
    
    
    
    
    @IBAction func asyncACtion(_ sender: Any) {

        Alamofire.request("https://stghybrisin.lulumea.com/lulucommercewebservices/v2/lulu-in/products/search?&query=%3Adiscount-desc%3Acategory%3AHY00214914&fields=FULL&pageSize=50&searchQueryContext=SUGGESTIONS&sort=discount-desc&currentPage=0").responseJSON { response in
            debugPrint(response)
            self.syncAButtonNumber += 1
            print("asyncNumber",self.syncAButtonNumber)
        }
        
        Alamofire.request("https://stghybrisin.lulumea.com/lulucommercewebservices/v2/lulu-in/products/search?&query=%3Adiscount-desc%3Acategory%3AHY00214914&fields=FULL&pageSize=50&searchQueryContext=SUGGESTIONS&sort=discount-desc&currentPage=0").responseJSON { response in
            debugPrint(response)
            self.syncAButtonNumber += 1
            print("asyncNumber",self.syncAButtonNumber)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    func tableview(){
        txt1.textContentType = .oneTimeCode
        txt1.delegate = self
        txt2.delegate = self
        txt3.delegate = self
        txt4.delegate = self
        txt5.delegate = self
        txt6.delegate = self
        
        txt1.text = "1213"
       
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 30))

        let centerView = UIView()
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.backgroundColor = UIColor.white
        view.addSubview(centerView)
        centerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        centerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        centerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Testing"
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.yellow
        centerView.addSubview(label)
        label.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
        label.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true

        view.layoutIfNeeded()
        self.tableView.tableHeaderView = view
        var tp = false
        if true,true{
            print("jijo")
        }
        var array = [1, 2, 3,5]
        array.shuffle()
        print(array)
        palyer()
        let response = ["jijo","happy"]
        for items in response {
           print(items)
        }
        PlayerItem = AVPlayerItem(url: NSURL(string: "https://moctobpltc-i.akamaihd.net/hls/live/571329/eight/playlist.m3u8") as! URL)
        let metadataOutput = AVPlayerItemMetadataOutput(identifiers: nil)
        metadataOutput.setDelegate(self, queue: DispatchQueue.main)
        PlayerItem.add(metadataOutput)
        Player = AVPlayer(playerItem: PlayerItem)
        Player.play()
        parseM3U8Data()
        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        
        textLabel.attributedText = attributedString
        
        textLabel.delegate = self
      //  textFeildTwo.delegate = self
       // texteldOne.delegate = self
      //  txt1.becomeFirstResponder()
       // self.textFeildTwo.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    //    self.texteldOne.becomeFirstResponder()
//
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.reloadData()
//        collectionView.delegate = self
//        collectionView.dataSource = self
        print(UIScreen.main.bounds.width)
//        if UIApplication.shared.statusBarOrientation.isLandscape {
//            let cellSize = CGSize(width: UIScreen.main.bounds.width / 2 - 25, height: 120)
//            landScapeaLyout.scrollDirection = .vertical //.horizontal
//            landScapeaLyout.itemSize = cellSize
//            landScapeaLyout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//            landScapeaLyout.minimumLineSpacing = 10.0
//            collectionView.setCollectionViewLayout(landScapeaLyout, animated: true)
//            collectionView.reloadData()
//        } else {
//            let cellSize = CGSize(width: UIScreen.main.bounds.width / 2 - 25, height: 120)
//            potrarScapeaLyout.scrollDirection = .vertical //.horizontal
//            potrarScapeaLyout.itemSize = cellSize
//            potrarScapeaLyout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//            potrarScapeaLyout.minimumLineSpacing = 10.0
//            collectionView.setCollectionViewLayout(potrarScapeaLyout, animated: true)
//            collectionView.reloadData()
//        }
      //  collectionView.reloadData()
       // NotificationCenter.default.addObserver(s
    }
    
    
    @IBAction func buaction(_ sender: Any) {
        UIApplication.shared.statusBarStyle = .lightContent
        setNeedsStatusBarAppearanceUpdate()
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
       if #available(iOS 12.0, *) {
           if textField.textContentType == UITextContentType.oneTimeCode{
               //here split the text to your four text fields
               if let otpCode = textField.text, otpCode.count > 3{
                textFeildTwo.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 0)])
                texteldOne.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 1)])
//                   txtThree.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 2)])
//                   txtFour.text = String(otpCode[otpCode.index(otpCode.startIndex, offsetBy: 3)])
               }
           }
        }
     }
    var darkMode = false
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return darkMode ? .default : .lightContent
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
           if ((textField.text?.count)! < 1 ) && (string.count > 0) {
               if textField == txt1 {
                   txt2.becomeFirstResponder()

               }

               if textField == txt2 {
                   txt3.becomeFirstResponder()

               }

               if textField == txt3 {
                   txt4.becomeFirstResponder()
               }

               if textField == txt4 {
                   txt5.becomeFirstResponder()
               }
               if textField == txt5 {
                   txt6.becomeFirstResponder()
               }
               if textField == txt6{
                   txt6.becomeFirstResponder()
               }

               textField.text = string
               return false
           } else if ((textField.text?.count)! >= 1) && (string.count == 0) {
               if textField == txt2 {
                   txt1.becomeFirstResponder()
               }
               if textField == txt3 {
                   txt2.becomeFirstResponder()

               }
               if textField == txt4 {
                   txt3.becomeFirstResponder()
               }

              if textField == txt5 {
                   txt4.becomeFirstResponder()
               }
               if textField == txt6 {
                   txt5.becomeFirstResponder()
               }
               if textField == txt1{
                  txt6.resignFirstResponder()
               }

               textField.text = ""
               return false
           } else if (textField.text?.count)! >= 1 {
               textField.text = string
               return false
           }

           return true
       }


    func parseM3U8Data() {
        //let baseUrl = URL(string: "http://142.44.136.164:8024/stream.m3u8")
         let baseUrl = URL(string: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3")
        let manager = M3U8Manager()
        let params = PlaylistOperation.Params(fetcher: nil, url: baseUrl!, playlistType: .master)
        let parserExtraParams = M3U8Parser.ExtraParams(customRequiredTags: nil, extraTypes: nil, linePostProcessHandler: nil) // optional
        let extraParams = PlaylistOperation.ExtraParams(parser: parserExtraParams) // optional
        let operationData = M3U8Manager.PlaylistOperationData(params: params, extraParams: extraParams)
        let playlistType =  MasterPlaylist.self
        manager.fetchAndParsePlaylist(from: operationData, playlistType: playlistType) { (result) in
          switch result {
          case .success(let playlist):
            let playlist = playlist.originalText
            self.extractChannelsFromRawString(playlist)
            break
          case .failure( _): break // handle the error
          case .cancelled: break  // handle cancelled
          }
        }
    }
    func extractChannelsFromRawString(_ string: String){
      string.enumerateLines { line, shouldStop in
        if line.hasPrefix("#EXTINF:") {
          let infoLine = line.replacingOccurrences(of: "#EXTINF:", with: "")
          let infoItems = infoLine.components(separatedBy: ",")
          if let title = infoItems.last {
                print("name",title)
            }
          }
        }
      }
    func metadataOutput(_ output: AVPlayerItemMetadataOutput, didOutputTimedMetadataGroups groups: [AVTimedMetadataGroup], from track: AVPlayerItemTrack?) {
        if let item = groups.first?.items.first,
           let songInfo = item.value(forKeyPath: "value") as? String {
            shouldGetArtwork(for: songInfo)
        }
    }
    
    
    private func shouldGetArtwork(for rawValue: String) {
         let artworkSize = 100
        self.getArtwork(for: rawValue, size: artworkSize, completionHandler: { [unowned self] artworlURL in
            DispatchQueue.main.async {
               // self.delegate?.radioPlayer?(self, artworkDidChange: artworlURL)
                print(artworlURL)
            }
        })
    }
     func getArtwork(for metadata: String, size: Int, completionHandler: @escaping (_ artworkURL: URL?) -> ()) {
        
        guard !metadata.isEmpty, metadata !=  " - ", let url = getURL(with: metadata) else {
            completionHandler(nil)
            return
        }
                
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard error == nil,
                let data = data,
                let parsedResult = try? JSONDecoder().decode(SongInfo.self, from: data).results.first
                else {
                completionHandler(nil)
                return
            }
            
            var artwork = parsedResult.artworkUrl100
            if size != 100, size > 0 {
                artwork = parsedResult.artworkUrl100.replacingOccurrences(of: "100x100", with: "\(size)x\(size)")
            }
            let artworkURL = URL(string: artwork)
            completionHandler(artworkURL)
            
        }).resume()
    }

    func getURL(with term: String) -> URL? {
       var components = URLComponents()
       components.scheme = Domain.scheme
       components.host = Domain.host
       components.path = Domain.path
       components.queryItems = [URLQueryItem]()
       components.queryItems?.append(URLQueryItem(name: Keys.term, value: term))
       components.queryItems?.append(URLQueryItem(name: Keys.entity, value: Values.entity))
       return components.url
    }
    
    override func observeValue(forKeyPath: String?, of: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
           if forKeyPath != "timedMetadata" { return }


           let data: AVPlayerItem = of as! AVPlayerItem

           guard let timedMetadata = data.timedMetadata else { return }

           for item in timedMetadata {
               switch item.commonKey {

               case .commonKeyAlbumName?:
                   print("AlbumName: \(item.value!)")
               case .commonKeyArtist?:
                   print("Artist: \(item.value!)")
               case .commonKeyArtwork?:
                   print("Artwork: \(item.value!)")
               case .commonKeyAuthor?:
                   print("Author: \(item.value!)")
               case .commonKeyContributor?:
                   print("Contributor: \(item.value!)")
               case .commonKeyCopyrights?:
                   print("Copyrights: \(item.value!)")
               case .commonKeyCreationDate?:
                   print("CreationDate: \(item.value!)")
               case .commonKeyCreator?:
                   print("creator: \(item.value!)")
               case .commonKeyDescription?:
                   print("Description: \(item.value!)")
               case .commonKeyFormat?:
                   print("Format: \(item.value!)")
               case .commonKeyIdentifier?:
                   print("Identifier: \(item.value!)")
               case .commonKeyLanguage?:
                   print("Language: \(item.value!)")
               case .commonKeyMake?:
                   print("Make: \(item.value!)")
               case .commonKeyModel?:
                   print("Model: \(item.value!)")
               case .commonKeyPublisher?:
                   print("Publisher: \(item.value!)")
               case .commonKeyRelation?:
                   print("Relation: \(item.value!)")
               case .commonKeySoftware?:
                   print("Software: \(item.value!)")
               case .commonKeySubject?:
                   print("Subject: \(item.value!)")
               case .commonKeyTitle?:
                   print("Title: \(item.value!)")
               case .commonKeyType?:
                   print("Type: \(item.value!)")

               case .id3MetadataKeyAlbumTitle?:
                   print("id3MetadataKeyAlbumTitle: \(item.value!)")

               default:
                   print("other data: \(item.value!)")
               }
           }
       }
    @objc func rotate(){
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.reloadData()
//        if UIApplication.shared.statusBarOrientation.isLandscape {
//            let cellSize = CGSize(width: UIScreen.main.bounds.height / 2 - 25, height: 120)
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .vertical //.horizontal
//            layout.itemSize = cellSize
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//            layout.minimumLineSpacing = 20.0
//            collectionView.setCollectionViewLayout(layout, animated: true)
//            collectionView.reloadData()
//        } else {
//            let cellSize = CGSize(width: UIScreen.main.bounds.height / 2 - 25, height: 120)
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .vertical //.horizontal
//            layout.itemSize = cellSize
//            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//            layout.minimumLineSpacing = 10.0
//            collectionView.setCollectionViewLayout(layout, animated: true)
//            collectionView.reloadData()
//        }
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    //    collectionView.collectionViewLayout.invalidateLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    func heightForHtmlString(_ text: NSAttributedString, font:UIFont) -> CGFloat {
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: CGFloat.greatestFiniteMagnitude))
      label.numberOfLines = 0
      label.lineBreakMode = NSLineBreakMode.byWordWrapping
      label.font = font
      label.attributedText = text
      label.sizeToFit()
      return label.frame.height
    }
    
    
    
    func palyer(){
        let urlstring = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
        let url = URL(string: urlstring)
        print("the url = \(url!)")
        play(url!)
    }
    
    func play(_ url: URL) {
        print("playing \(url)")
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player.volume = 1.0
            player.play()
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
        }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // use this
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomeTableViewCell", for: indexPath) as? CustomeTableViewCell {
            cell.layoutSubviews()
            return cell
        }
        return UITableViewCell()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isHappend {
            return 50 * 20
        }
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        isHappend = !isHappend
//        self.tableView.reloadRows(at: [indexPath], with: .automatic)
     //   NotificationCenter.default.post(name: Notification.Name("myNotification"), object: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomeViewController") as! CustomeViewController
       // vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
//    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
//
//        let centerView = UIView()
//        centerView.translatesAutoresizingMaskIntoConstraints = false
//        centerView.backgroundColor = UIColor.white
//        view.addSubview(centerView)
//        centerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        centerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
//        centerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
//
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Testing"
//        label.textColor = UIColor.black
//        label.backgroundColor = UIColor.yellow
//        centerView.addSubview(label)
//        label.leftAnchor.constraint(equalTo: centerView.leftAnchor).isActive = true
//        label.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
//
//        view.layoutIfNeeded()
//        return view
//    }
//
//    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44  // or whatever
//    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print(scrollView.contentOffset.y )
//        if scrollView.contentOffset.y > 40 {
//            UIView.animate(withDuration: 0.5, animations: {
//                self.searchMainBarView.transform = CGAffineTransform(translationX: 0, y: -58)
//            }, completion: nil)
//            
//        }
//        if scrollView.contentOffset.y < 40 {
//            UIView.animate(withDuration: 0.4, animations: {
//                self.searchMainBarView.transform = .identity
//            }, completion: nil)
//            
//        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCollectionViewCell", for: indexPath) as! TabCollectionViewCell
        return cell
        
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.isselected = !isselected
        self.happYView.alpha = isselected ? 1 : 0
        self.tabBarController?.tabBar.isHidden = isselected ? true : false
                tabBarController?.tabBar.frame.size.height   = 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize = CGSize(width:0 ,height:0)
        print( UIScreen.main.bounds.height / 5)
        if UIApplication.shared.statusBarOrientation.isLandscape {
            if cellSizeLandscape.width == 0{
                cellSize = CGSize(width: UIScreen.main.bounds.width / 2 - 25, height: UIScreen.main.bounds.height / 5)
                cellSizeLandscape = cellSize
            }
            cellSize = cellSizeLandscape
        } else {
            if cellSizePortait.width == 0{
                cellSize = CGSize(width: UIScreen.main.bounds.width / 2 - 25, height: UIScreen.main.bounds.height / 5)
                cellSizePortait = cellSize
            }
            cellSize = cellSizePortait
        }
        return cellSize
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}


struct SongInfo: Codable {
let resultCount: Int
let results: [Result]
}

struct Result: Codable {
let wrapperType: String
let kind: String
let artistId: Int
let collectionId: Int
let trackId: Int
let artistName: String
let collectionName: String
let trackName: String
let collectionCensoredName: String
let trackCensoredName: String
let artistViewUrl: String
let collectionViewUrl: String
let trackViewUrl: String
let previewUrl: String
let artworkUrl30: String
let artworkUrl60: String
let artworkUrl100: String
let releaseDate: String
let collectionExplicitness: String
let trackExplicitness: String
let discCount: Int
let discNumber: Int
let trackCount: Int
let trackNumber: Int
let trackTimeMillis: Int
let country: String
let currency: String
let primaryGenreName: String
let isStreamable: Bool
}




// MARK: - Constants

private struct Domain {
static let scheme = "https"
static let host = "itunes.apple.com"
static let path = "/search"
}

private struct Keys {
// Request
static let term = "term"
static let entity = "entity"

// Response
static let results = "results"
static let artwork = "artworkUrl100"
}

private struct Values {
static let entity = "song"
}
func currentTimeInMilliSeconds()-> Int
    {
        let currentDate = Date()
        let since1970 = currentDate.timeIntervalSince1970
        return Int(since1970 * 1000)
    }
