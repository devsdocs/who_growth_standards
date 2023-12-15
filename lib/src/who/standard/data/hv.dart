part of '../standard.dart';

const heightVelocity =
    '''
{"1":{"2":{"0_2":{"l":0.9267,"m":4.6878,"s":0.16093},"1_3":{"l":0.621,"m":3.3714,"s":0.15634},"2_4":{"l":0.5607,"m":2.517,"s":0.16382},"3_5":{"l":0.6219,"m":2.0747,"s":0.18097},"4_6":{"l":0.7141,"m":1.7184,"s":0.207},"5_7":{"l":0.7879,"m":1.4381,"s":0.23798},"6_8":{"l":0.8482,"m":1.2009,"s":0.27392},"7_9":{"l":0.8985,"m":1.0106,"s":0.31173},"8_10":{"l":0.9379,"m":0.8731,"s":0.35212},"9_11":{"l":0.9577,"m":0.7615,"s":0.39591},"10_12":{"l":0.9598,"m":0.6659,"s":0.44007}},"3":{"0_3":{"l":0.7558,"m":6.0419,"s":0.13725},"1_4":{"l":0.4737,"m":4.5132,"s":0.13624},"2_5":{"l":0.4137,"m":3.4944,"s":0.14382},"3_6":{"l":0.4858,"m":2.8568,"s":0.15846},"4_7":{"l":0.5992,"m":2.384,"s":0.17799},"5_8":{"l":0.7074,"m":1.9903,"s":0.20021},"6_9":{"l":0.8123,"m":1.6704,"s":0.22358},"7_10":{"l":0.9028,"m":1.4214,"s":0.24758},"8_11":{"l":0.9602,"m":1.2321,"s":0.27193},"9_12":{"l":0.9852,"m":1.0768,"s":0.29648}},"4":{"0_4":{"l":0.3279,"m":7.1133,"s":0.1244},"1_5":{"l":0.4212,"m":5.4806,"s":0.12713},"2_6":{"l":0.5076,"m":4.2702,"s":0.13454},"3_7":{"l":0.584,"m":3.5185,"s":0.14592},"4_8":{"l":0.6557,"m":2.9255,"s":0.16106},"5_9":{"l":0.7179,"m":2.4506,"s":0.17841},"6_10":{"l":0.7719,"m":2.078,"s":0.19784},"7_11":{"l":0.818,"m":1.7696,"s":0.21918},"8_12":{"l":0.8532,"m":1.5301,"s":0.24082},"9_13":{"l":0.8808,"m":1.3368,"s":0.26394},"10_14":{"l":0.9009,"m":1.1844,"s":0.28656},"11_15":{"l":0.9166,"m":1.0457,"s":0.3097},"12_16":{"l":0.9278,"m":0.9301,"s":0.33162},"13_17":{"l":0.9357,"m":0.8359,"s":0.35292},"14_18":{"l":0.9414,"m":0.7605,"s":0.37421},"15_19":{"l":0.9452,"m":0.707,"s":0.39409},"16_20":{"l":0.948,"m":0.6637,"s":0.41387},"17_21":{"l":0.95,"m":0.6277,"s":0.43237},"18_22":{"l":0.9518,"m":0.5923,"s":0.45102},"19_23":{"l":0.9535,"m":0.5575,"s":0.46942},"20_24":{"l":0.955,"m":0.5248,"s":0.48711}},"6":{"0_6":{"l":0.4441,"m":8.864,"s":0.1101},"1_7":{"l":0.4988,"m":6.9439,"s":0.11688},"2_8":{"l":0.5465,"m":5.5066,"s":0.12498},"3_9":{"l":0.5888,"m":4.526,"s":0.13512},"4_10":{"l":0.6269,"m":3.7983,"s":0.14708},"5_11":{"l":0.6616,"m":3.2122,"s":0.16026},"6_12":{"l":0.6933,"m":2.7354,"s":0.17427},"7_13":{"l":0.7226,"m":2.3511,"s":0.18884},"8_14":{"l":0.7499,"m":2.0461,"s":0.20363},"9_15":{"l":0.7754,"m":1.7985,"s":0.21837},"10_16":{"l":0.7993,"m":1.5932,"s":0.2328},"11_17":{"l":0.8218,"m":1.4211,"s":0.24672},"12_18":{"l":0.8431,"m":1.2795,"s":0.26021},"13_19":{"l":0.8633,"m":1.1676,"s":0.27339},"14_20":{"l":0.8825,"m":1.0785,"s":0.28632},"15_21":{"l":0.9009,"m":1.0078,"s":0.29903},"16_22":{"l":0.9184,"m":0.9483,"s":0.31159},"17_23":{"l":0.9351,"m":0.8976,"s":0.32406},"18_24":{"l":0.9512,"m":0.8511,"s":0.33648}}},"2":{"2":{"0_2":{"l":0.8807,"m":4.3539,"s":0.15953},"1_3":{"l":0.8807,"m":3.1035,"s":0.16706},"2_4":{"l":0.8807,"m":2.3473,"s":0.18107},"3_5":{"l":0.8807,"m":1.9599,"s":0.20017},"4_6":{"l":0.8807,"m":1.6524,"s":0.22476},"5_7":{"l":0.8807,"m":1.3981,"s":0.25281},"6_8":{"l":0.8807,"m":1.1762,"s":0.28607},"7_9":{"l":0.8807,"m":0.9921,"s":0.32161},"8_10":{"l":0.8807,"m":0.8471,"s":0.35933},"9_11":{"l":0.8807,"m":0.7384,"s":0.40034},"10_12":{"l":0.8807,"m":0.6552,"s":0.44193}},"3":{"0_3":{"l":0.4252,"m":5.5822,"s":0.14155},"1_4":{"l":0.5408,"m":4.1837,"s":0.14611},"2_5":{"l":0.6316,"m":3.2594,"s":0.15573},"3_6":{"l":0.7066,"m":2.7161,"s":0.16952},"4_7":{"l":0.7704,"m":2.2991,"s":0.18602},"5_8":{"l":0.8262,"m":1.9451,"s":0.20505},"6_9":{"l":0.8756,"m":1.6363,"s":0.22644},"7_10":{"l":0.9201,"m":1.3903,"s":0.2492},"8_11":{"l":0.9605,"m":1.2025,"s":0.27282},"9_12":{"l":0.9976,"m":1.069,"s":0.29743}},"4":{"0_4":{"l":0.5215,"m":6.6605,"s":0.12888},"1_5":{"l":0.5902,"m":5.075,"s":0.13444},"2_6":{"l":0.6469,"m":4.0154,"s":0.14318},"3_7":{"l":0.6952,"m":3.3542,"s":0.15397},"4_8":{"l":0.7374,"m":2.8419,"s":0.16676},"5_9":{"l":0.7748,"m":2.3945,"s":0.18192},"6_10":{"l":0.8085,"m":2.0271,"s":0.19915},"7_11":{"l":0.8391,"m":1.7353,"s":0.21812},"8_12":{"l":0.8672,"m":1.5073,"s":0.23888},"9_13":{"l":0.8931,"m":1.3296,"s":0.26147},"10_14":{"l":0.9172,"m":1.1864,"s":0.28575},"11_15":{"l":0.9397,"m":1.0642,"s":0.31149},"12_16":{"l":0.9608,"m":0.9573,"s":0.33813},"13_17":{"l":0.9808,"m":0.8664,"s":0.36514},"14_18":{"l":0.9996,"m":0.794,"s":0.39238},"15_19":{"l":1.0175,"m":0.7411,"s":0.41976},"16_20":{"l":1.0344,"m":0.6953,"s":0.44691},"17_21":{"l":1.0506,"m":0.6457,"s":0.4735},"18_22":{"l":1.0661,"m":0.5953,"s":0.49958},"19_23":{"l":1.081,"m":0.5473,"s":0.52538},"20_24":{"l":1.0952,"m":0.5013,"s":0.55112}},"6":{"0_6":{"l":0.2608,"m":8.2683,"s":0.11607},"1_7":{"l":0.3426,"m":6.5037,"s":0.11997},"2_8":{"l":0.414,"m":5.2206,"s":0.1259},"3_9":{"l":0.4774,"m":4.341,"s":0.13381},"4_10":{"l":0.5344,"m":3.6748,"s":0.14324},"5_11":{"l":0.5863,"m":3.1336,"s":0.15447},"6_12":{"l":0.6338,"m":2.689,"s":0.16777},"7_13":{"l":0.6777,"m":2.3226,"s":0.18258},"8_14":{"l":0.7186,"m":2.0288,"s":0.19851},"9_15":{"l":0.7567,"m":1.7978,"s":0.21524},"10_16":{"l":0.7925,"m":1.6098,"s":0.23248},"11_17":{"l":0.8262,"m":1.45,"s":0.24989},"12_18":{"l":0.8581,"m":1.3166,"s":0.26722},"13_19":{"l":0.8884,"m":1.2111,"s":0.28419},"14_20":{"l":0.9172,"m":1.1249,"s":0.30032},"15_21":{"l":0.9446,"m":1.0506,"s":0.31516},"16_22":{"l":0.9708,"m":0.9819,"s":0.32846},"17_23":{"l":0.9959,"m":0.9149,"s":0.34024},"18_24":{"l":1.02,"m":0.8494,"s":0.35116}}}}
''';
