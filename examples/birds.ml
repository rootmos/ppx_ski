let%ski B = ((S(KS))K) (* Bluebird *)
let%ski B1 = ((S(K((S(KS))K)))((S(KS))K)) (* Blackbird *)
let%ski B2 = ((S(K((S(K((S(KS))K)))((S(KS))K))))((S(KS))K)) (* Bunting *)
let%ski B3 = ((S(K((S(K((S(KS))K)))((S(KS))K))))((S(KS))K)) (* Becard *)
let%ski C = ((S((S(K((S(KS))K)))S))(KK)) (* Cardinal *)
let%ski D = (S(K((S(KS))K))) (* Dove *)
let%ski D1 = (S(K(S(K((S(KS))K))))) (* Dickcissel *)
let%ski D2 = ((S(K((S(KS))K)))(S(K((S(KS))K)))) (* Dovekies *)
let%ski E = (S(K((S(K((S(KS))K)))((S(KS))K)))) (* Eagle *)
let%ski E1 = ((S(K((S(K((S(KS))K)))((S(KS))K))))(S(K((S(K((S(KS))K)))((S(KS))K))))) (* Bald Eagle *)
let%ski F = ((S(K((S((SK)K))(K((S(K(S((SK)K))))K)))))((S(K((S(K((S(KS))K)))((S(KS))K))))((S(K(S((SK)K))))K))) (* Finch *)
let%ski G = ((S(K((S(KS))K)))((S((S(K((S(KS))K)))S))(KK))) (* Goldfinch *)
let%ski H = ((S(K((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K)))(S(K((S((S(K((S(KS))K)))S))(KK))))) (* Hummingbird *)
let%ski I = ((SK)K) (* Identity Bird (aka Idiot) *)
let%ski J = ((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))(K((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S(K((S(KS))K)))((S(KS))K)))))))) (* Jay *)
let%ski K = K (* Kestrel (True) *)
let%ski L = ((S((S(KS))K))(K((S((SK)K))((SK)K)))) (* Lark *)
let%ski M = ((S((SK)K))((SK)K)) (* Mockingbird *)
let%ski M2 = (S(K((S((SK)K))((SK)K)))) (* Double Mockingbird *)
let%ski O = (S((SK)K)) (* Owl *)
let%ski Q = ((S(K(S((S(KS))K))))K) (* Queer Bird *)
let%ski Q1 = ((S(K((S((S(K((S(KS))K)))S))(KK))))((S(KS))K)) (* Quixotic Bird *)
let%ski Q2 = ((S(K(S((S(K((S((S(K((S(KS))K)))S))(KK))))((S(KS))K)))))K) (* Quizzical Bird *)
let%ski Q3 = (S(K((S(K(S((SK)K))))K))) (* Quirky Bird *)
let%ski Q4 = ((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S((S(K((S((S(K((S(KS))K)))S))(KK))))((S(KS))K)))))K)) (* Quacky Bird *)
let%ski R = ((S(K((S(KS))K)))((S(K(S((SK)K))))K)) (* Robin *)
let%ski S = S (* Starling *)
let%ski T = ((S(K(S((SK)K))))K) (* Thrush *)
let%ski U = ((S(K(S((SK)K))))((S((SK)K))((SK)K))) (* Turing *)
let%ski V = ((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S((SK)K))))K)) (* Vireo (aka Pairing) *)
let%ski W = ((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K) (* Warbler *)
let%ski W1 = ((S(K(S((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K))))K) (* Converse Warbler *)
let%ski Y = (((SS)K)((S(K((SS)(S((SS)K)))))K)) (* Why Bird (aka Sage Bird) *)
let%ski I1 = (S(SK)) (* Identity Bird Once Removed *)
let%ski W1 = (S(K((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K))) (* Warbler Once Removed *)
let%ski C1 = (S(K((S((S(K((S(KS))K)))S))(KK)))) (* Cardinal Once Removed *)
let%ski R1 = ((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK))))) (* Robin Once Removed *)
let%ski F1 = ((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK)))))) (* Finch Once Removed *)
let%ski V1 = ((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK))))))) (* Vireo Once Removed *)
(*let%ski I2 = () (* Identity Bird Twice Removed *)*)
let%ski W2 = (S(K(S(K((S(K(S((S(K((S((SK)K))((SK)K))))((S(K((S(KS))K)))((S(K(S((SK)K))))K))))))K))))) (* Warbler Twice Removed *)
let%ski C2 = (S(K(S(K((S((S(K((S(KS))K)))S))(KK)))))) (* Cardinal Twice Removed *)
let%ski R2 = (S(K((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK))))))) (* Robin Twice Removed *)
let%ski F2 = (S(K((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK)))))))) (* Finch Twice Removed *)
let%ski V2 = (S(K((S(K((S((S(K((S(KS))K)))S))(KK))))((S(K(S(K((S((S(K((S(KS))K)))S))(KK))))))((S(K((S((S(K((S(KS))K)))S))(KK))))(S(K((S((S(K((S(KS))K)))S))(KK))))))))) (* Vireo Twice Removed *)
let%ski KI = (K((SK)K)) (* Kite (False) *)
let%ski W2 = (((S((SK)K))((SK)K))((S((SK)K))((SK)K))) (* Omega *)
let%ski KM = (K((S((SK)K))((SK)K))) (* Konstant Mocker *)
let%ski CC = ((S(K(S(K((S((SK)K))((SK)K))))))K) (* Crossed Konstant Mocker *)
let%ski Q = ((((SS)K)((S(K((SS)(S((SS)K)))))K)(S((SK)K)))) (* Theta *)