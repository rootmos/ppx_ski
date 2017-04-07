let bluebird                    = {|((S(KS))K)|}
let blackbird                   = {|((S(K((S(KS))K)))((S(KS))K))|}
let bunting                     = {|((S(K((S(K((S(KS))K)))((S(KS))K))))((S(KS))K))|}
let becard                      = {|((S(K((S(K((S(KS))K)))((S(KS))K))))((S(KS))K))|}
let cardinal                    = {|((S((S(K((S(KS))K)))S))(KK))|}
let dove                        = {|(S(K((S(KS))K)))|}
let dickcissel                  = {|(S(K(S(K((S(KS))K)))))|}
let dovekies                    = {|((S(K((S(KS))K)))(S(K((S(KS))K))))|}
let eagle                       = {|(S(K((S(K((S(KS))K)))((S(KS))K))))|}
let bald_eagle                  = {|((S(K((S(K((S(KS))K)))((S(KS))K))))(S(K((S(K((S(KS))K)))((S(KS))K)))))|}
let finch                       = {|((S(K((S((SK)K))(K((S(K(S((SK)K))))K)))))((S(K((S(K((S(KS))K)))((S(KS))K))))((S(K(S((SK)K))))K)))|}
let goldfinch                   = {|((S(K((S(KS))K)))((S((S(K((S(KS))K)))S))(KK)))|}
(*let hummingbird                 = {|((S(K((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K)))(S(K((S((S(K((S(KS))K)))S))(KK)))))|}*)
let identity                    = {|((SK)K)|}
(*let jay                         = {|((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))(K((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S(K((S(KS))K)))((S(KS))K))))))))|}*)
let kestrel                     = {|K|}
(*let lark                        = {|((S((S(KS))K))(K((S((SK)K))((SK)K))))|}*)
(*let mockingbird                 = {|((S((SK)K))((SK)K))|}*)
(*let double_mockingbird          = {|(S(K((S((SK)K))((SK)K))))|}*)
let owl                         = {|(S((SK)K))|}
let queer_bird                  = {|((S(K(S((S(KS))K))))K)|}
let quixotic_bird               = {|((S(K((S((S(K((S(KS))K)))S))(KK))))((S(KS))K))|}
let quizzical_bird              = {|((S(K(S((S(K((S((S(K((S(KS))K)))S))(KK))))((S(KS))K)))))K)|}
let quirky_bird                 = {|(S(K((S(K(S((SK)K))))K)))|}
let quacky_bird                 = {|((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S((S(K((S((S(K((S(KS))K)))S))(KK))))((S(KS))K)))))K))|}
let robin                       = {|((S(K((S(KS))K)))((S(K(S((SK)K))))K))|}
let starling                    = {|S|}
let thrush                      = {|((S(K(S((SK)K))))K)|}
(*let turing                      = {|((S(K(S((SK)K))))((S((SK)K))((SK)K)))|}*)
let vireo                       = {|((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S((SK)K))))K))|}
(*let warbler                     = {|((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K)|}*)
(*let converse_warbler            = {|((S(K(S((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K))))K)|}*)
(*let why_bird                    = {|((SS)K)((S(K((SS)(S((SS)K)))))K)|}*)
let identity_bird_once_removed  = {|(S(SK))|}
(*let warbler_once_removed        = {|(S(K((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K)))|}*)
let cardinal_once_removed       = {|(S(K((S((S(K((S(KS))K)))S))(KK))))|}
let robin_once_removed          = {|((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK)))))|}
let finch_once_removed          = {|((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK))))))|}
let vireo_once_removed          = {|((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK)))))))|}
let identity_bird_twice_removed = {||}
(*let warbler_twice_removed       = {|(S(K(S(K((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K)))))|}*)
let cardinal_twice_removed      = {|(S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))|}
let robin_twice_removed         = {|(S(K((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK)))))))|}
let finch_twice_removed         = {|(S(K((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK))))))))|}
let vireo_twice_removed         = {|(S(K((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK)))))))))|}
let kite                        = {|(K((SK)K))|}
(*let omega                       = {|(((S((SK)K))((SK)K))((S((SK)K))((SK)K)))|}*)
(*let konstant_mocker             = {|(K((S((SK)K))((SK)K)))|}*)
(*let crossed_konstant_mocker     = {|((S(K(S(K((S((SK)K))((SK)K))))))K)|}*)
(*let theta                       = {|(((SS)K)((S(K((SS)(S((SS)K)))))K)(S((SK)K)))|}*)
