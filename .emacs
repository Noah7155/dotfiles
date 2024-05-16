(display-time)

;; Miscellaneous startup appearance settings
(setq inhibit-startup-message t
      initial-scratch-message ""
      cursor-type 'bar
      interprogram-cut-function nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-fringe-mode 10)
(recentf-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(set-frame-font "Terminus 10" nil t)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(global-display-line-numbers-mode)
(setq scroll-conservatively 101)

;; Custom Keybinds
(global-set-key (kbd "C-c t") 'org-insert-todo-heading)

;; Melpa Stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; custom set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes '(doom-rouge))
 '(custom-safe-themes
   '("93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d" "333958c446e920f5c350c4b4016908c130c3b46d590af91e1e7e2a0611f1e8c5" "8146edab0de2007a99a2361041015331af706e7907de9d6a330a3493a541e5a6" "a6e620c9decbea9cac46ea47541b31b3e20804a4646ca6da4cce105ee03e8d0e" "0d01e1e300fcafa34ba35d5cf0a21b3b23bc4053d388e352ae6a901994597ab1" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "fe2539ccf78f28c519541e37dc77115c6c7c2efcec18b970b16e4a4d2cd9891d" "353ffc8e6b53a91ac87b7e86bebc6796877a0b76ddfc15793e4d7880976132ae" "a0be7a38e2de974d1598cf247f607d5c1841dbcef1ccd97cded8bea95a7c7639" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "4f1d2476c290eaa5d9ab9d13b60f2c0f1c8fa7703596fa91b235db7f99a9441b" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "c5ded9320a346146bbc2ead692f0c63be512747963257f18cc8518c5254b7bf5" "e2c926ced58e48afc87f4415af9b7f7b58e62ec792659fcb626e8cba674d2065" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "d6844d1e698d76ef048a53cefe713dbbe3af43a1362de81cdd3aefa3711eae0d" "5f19cb23200e0ac301d42b880641128833067d341d22344806cdad48e6ec62f6" "47db50ff66e35d3a440485357fb6acb767c100e135ccdf459060407f8baea7b2" "da53441eb1a2a6c50217ee685a850c259e9974a8fa60e899d393040b4b8cc922" "f7fed1aadf1967523c120c4c82ea48442a51ac65074ba544a5aefc5af490893b" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "3319c893ff355a88b86ef630a74fad7f1211f006d54ce451aab91d35d018158f" "66bdbe1c7016edfa0db7efd03bb09f9ded573ed392722fb099f6ac6c6aefce32" "850bb46cc41d8a28669f78b98db04a46053eca663db71a001b40288a9b36796c" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "c2aeb1bd4aa80f1e4f95746bda040aafb78b1808de07d340007ba898efa484f5" "1704976a1797342a1b4ea7a75bdbb3be1569f4619134341bd5a4c1cfb16abad4" "d268b67e0935b9ebc427cad88ded41e875abfcc27abd409726a92e55459e0d01" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "4699e3a86b1863bbc695236036158d175a81f0f3ea504e2b7c71f8f7025e19e3" "1278c5f263cdb064b5c86ab7aa0a76552082cf0189acf6df17269219ba496053" "1bddd01e6851f5c4336f7d16c56934513d41cc3d0233863760d1798e74809b4b" "6f4421bf31387397f6710b6f6381c448d1a71944d9e9da4e0057b3fe5d6f2fad" "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "e19ac4ef0f028f503b1ccafa7c337021834ce0d1a2bca03fcebc1ef635776bea" "22ce392ec78cd5e512169f8960edf5cbbad70e01d3ed0284ea62ab813d4ff250" "4b6b6b0a44a40f3586f0f641c25340718c7c626cbf163a78b5a399fbe0226659" "84b14a0a41bb2728568d40c545280dbe7d6891221e7fbe7c2b1c54a3f5959289" "e8df30cd7fb42e56a4efc585540a2e63b0c6eeb9f4dc053373e05d774332fc13" "76ed126dd3c3b653601ec8447f28d8e71a59be07d010cd96c55794c3008df4d7" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "266ecb1511fa3513ed7992e6cd461756a895dcc5fef2d378f165fed1c894a78c" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "b186688fbec5e00ee8683b9f2588523abdf2db40562839b2c5458fcfb322c8a4" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "6c531d6c3dbc344045af7829a3a20a09929e6c41d7a7278963f7d3215139f6a7" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "3d54650e34fa27561eb81fc3ceed504970cc553cfd37f46e8a80ec32254a3ec3" "1f1b545575c81b967879a5dddc878783e6ebcca764e4916a270f9474215289e5" "a82ab9f1308b4e10684815b08c9cac6b07d5ccb12491f44a942d845b406b0296" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "6c98bc9f39e8f8fd6da5b9c74a624cbb3782b4be8abae8fd84cbc43053d7c175" "028c226411a386abc7f7a0fba1a2ebfae5fe69e2a816f54898df41a6a3412bb5" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "b273cc6a1d492660fff886a3cae1f00d5fd2d53b55fb374a21a14afd74fdec92" "b6c43bb2aea78890cf6bd4a970e6e0277d2daf0075272817ea8bb53f9c6a7f0a" "91c008faf603a28d026957120a5a924a3c8fff0e12331abf5e04c0e9dd310c65" "0ed3d96a506b89c1029a1ed904b11b5adcebeb2e0c16098c99c0ad95cb124729" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "5e3fc08bcadce4c6785fc49be686a4a82a356db569f55d411258984e952f194a" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "1711947b59ea934e396f616b81f8be8ab98e7d57ecab649a97632339db3a3d19" "98fada4d13bcf1ff3a50fceb3ab1fea8619564bb01a8f744e5d22e8210bfff7b" "f0eb51d80f73b247eb03ab216f94e9f86177863fb7e48b44aacaddbfe3357cf1" "db5b906ccc66db25ccd23fc531a213a1afb500d717125d526d8ff67df768f2fc" "ca4bb64f9d4e47dd64a610f73a0e13f71d46454843c32420ce645e5da97b5d2d" "02afc9236ae54e19cd3b47a4d4c280e662a24353b4133a7eb57829863a6e739f" "3aee682b4e425deffc7c27aa1147fa2fe330f66e51f73b891a79792fc17a4d7c" "d7bbfe1da9f35b133b47420c3090fd036be69bfac580954038644ca50da9caef" "39424ad825c14bd2ef46ffd60244c49b84a183fb031df4e9ea9a340fbca36404" "b977ace8d45785eb0a9ef4ee312203cac84ee392f5b46e623f0f9bca31914b05" "b760dd82b1cc0139b76b20757daa783c162fa437d3595fd8bc068d00b1b793bd" "39510899409b650a76c90af05b59ada07bda2997779afedcb139ba7f5b30fac7" "bf25542a72db85c8bdc15e3ac857317ea1d371931bd82b0dc0888125b227fe65" "78622a4795f79462be7b53e372c8c243d5917523eeeef15ec2c2afa2421c1244" "46726da889aa1616ad3e9995b265883c7121ff1895d6fbdbfafc51d2cd11457d" "ac9bc68e802bf2384a26a281d485104af8cfcf4055de21dcf77dc75785d8eeb2" "d6032e0ae07e02c9e1cddedfaf678e1845441432d4c7fb8a8dac11046ed5aa0c" "5c64430cb8e12e2486cd9f74d4ce5172e00f8e633095d27edd212787a4225245" "9397f3ba34bdae8fec1183fc0b8aaf09599fab40af69ba58e167e3d2242327c0" "9316d66f16f4c3ae9fca6c79efc5712b99a6edaf4f984ecc8ae918354fa8f03a" "9d0928c3d13b35949a6e903e50abc1d52bd5650e452267a1b0599605769c2f1f" "11b065294966525b84003ba8204b2870f25861fccd11149f09e65510bacc4cfa" "af7f6d6858f78922d1be9c9e0a49a37fb6e425bdd5f6ac7a39912dc5951d2f2e" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "de1bf2ed5e8ff97ce2d8f277f1d022a8a9141d5c7afe5248c5df077f30168a1b" "118a855961a4e51d142da60905eaffbfebabcf7e31b03e2a87542abaaa11b044" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "5119eac8f91b0b2edf320e4660918f2415b90b661d4df1a2b0a37fe30ed44d4a" default))
 '(display-time-mode t)
 '(fci-rule-color "#383838")
 '(global-display-line-numbers-mode t)
 '(linum-format " %7i ")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(rust-mode evil org-ac org org-agenda-property org-modern doom-themes emojify neotree autothemer nano-theme vundo dts-mode orgit ztree alect-themes boxquote anti-zenburn-theme ample-theme afternoon-theme dict-tree company async vcl-mode html5-schema context-coloring chess ascii-art-to-unicode exwm minimap svg-clock svg undo-tree windresize csharp-mode clipboard-collector))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "#335" :foreground "#ddd") nil))))
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-dusk)
     (when (display-graphic-p)
       ;; settings for GUI emacs
       (add-to-list 'default-frame-alist '(background-color . "#282B35"))
       (add-to-list 'default-frame-alist '(foreground-color . "White"))
       (set-frame-font "Terminus 10" nil t))))

;; company mode settings
(global-company-mode)
(setq company-idle-delay 0
      company-minimum-prefix-length 3
      company-selection-wrap-around t)
(defface company-box-background
  '((t :inherit company-tooltip))
  "Face used for frame's background.
Only the background color is used in this face."
  :group 'company-box)
(defface company-tooltip
  '((default :foreground "blue")
    (((class color) (min-colors 88) (background light))
     (:background "black"))
    (((class-color) (min-colors 88) (background dark))
     (:background "white")))
  "Face used for the tooltip.")
(put 'upcase-region 'disabled nil)
