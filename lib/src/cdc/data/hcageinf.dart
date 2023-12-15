part of '../cdc.dart';

const cdchcageinf = '''
{"1":{"0":{"l":4.427825037,"m":35.81366835,"s":0.052172542},"0.5":{"l":4.310927464,"m":37.19361054,"s":0.047259148},"1.5":{"l":3.869576802,"m":39.20742929,"s":0.040947903},"2.5":{"l":3.305593039,"m":40.65233195,"s":0.037027722},"3.5":{"l":2.720590297,"m":41.76516959,"s":0.034364245},"4.5":{"l":2.16804824,"m":42.66116148,"s":0.032462175},"5.5":{"l":1.675465689,"m":43.40488731,"s":0.031064702},"6.5":{"l":1.255160322,"m":44.03609923,"s":0.03002267},"7.5":{"l":0.91054114,"m":44.58096912,"s":0.029242173},"8.5":{"l":0.639510474,"m":45.05761215,"s":0.028660454},"9.5":{"l":0.436978864,"m":45.4790756,"s":0.0282336},"10.5":{"l":0.296275856,"m":45.85505706,"s":0.027929764},"11.5":{"l":0.210107251,"m":46.19295427,"s":0.027725179},"12.5":{"l":0.171147024,"m":46.49853438,"s":0.027601686},"13.5":{"l":0.172393886,"m":46.77637684,"s":0.027545148},"14.5":{"l":0.207371541,"m":47.03017599,"s":0.027544382},"15.5":{"l":0.270226126,"m":47.2629533,"s":0.027590417},"16.5":{"l":0.355757274,"m":47.47720989,"s":0.02767598},"17.5":{"l":0.459407627,"m":47.67503833,"s":0.027795115},"18.5":{"l":0.577227615,"m":47.85820606,"s":0.0279429},"19.5":{"l":0.705826778,"m":48.02821867,"s":0.028115241},"20.5":{"l":0.842319055,"m":48.18636864,"s":0.028308707},"21.5":{"l":0.984266833,"m":48.3337732,"s":0.028520407},"22.5":{"l":1.129626698,"m":48.47140432,"s":0.028747896},"23.5":{"l":1.276691223,"m":48.60011223,"s":0.028989089},"24.5":{"l":1.424084853,"m":48.72064621,"s":0.029242207},"25.5":{"l":1.570621291,"m":48.83366629,"s":0.029505723},"26.5":{"l":1.715393998,"m":48.93976089,"s":0.029778323},"27.5":{"l":1.857652984,"m":49.03945383,"s":0.030058871},"28.5":{"l":1.996810563,"m":49.13321432,"s":0.030346384},"29.5":{"l":2.132411346,"m":49.22146409,"s":0.030640006},"30.5":{"l":2.264111009,"m":49.30458348,"s":0.030938992},"31.5":{"l":2.391658052,"m":49.38291658,"s":0.031242693},"32.5":{"l":2.514878222,"m":49.45677569,"s":0.031550537},"33.5":{"l":2.633661226,"m":49.526445,"s":0.031862026},"34.5":{"l":2.747949445,"m":49.59218385,"s":0.03217672},"35.5":{"l":2.857728375,"m":49.65422952,"s":0.032494231},"36":{"l":2.910932095,"m":49.68393611,"s":0.032653934}},"2":{"0":{"l":-1.298749689,"m":34.7115617,"s":0.046905108},"0.5":{"l":-1.440271514,"m":36.03453876,"s":0.042999604},"1.5":{"l":-1.581016348,"m":37.97671987,"s":0.038067862},"2.5":{"l":-1.593136386,"m":39.3801263,"s":0.035079612},"3.5":{"l":-1.521492427,"m":40.46773733,"s":0.033096443},"4.5":{"l":-1.394565915,"m":41.34841008,"s":0.03170963},"5.5":{"l":-1.231713389,"m":42.0833507,"s":0.030709039},"6.5":{"l":-1.046582628,"m":42.71033603,"s":0.029974303},"7.5":{"l":-0.848932692,"m":43.25428882,"s":0.029430992},"8.5":{"l":-0.645779124,"m":43.73249646,"s":0.029030379},"9.5":{"l":-0.442165412,"m":44.15742837,"s":0.028739112},"10.5":{"l":-0.24163206,"m":44.53836794,"s":0.028533537},"11.5":{"l":-0.046673786,"m":44.88240562,"s":0.028396382},"12.5":{"l":0.141031094,"m":45.19507651,"s":0.028314722},"13.5":{"l":0.320403169,"m":45.48078147,"s":0.028278682},"14.5":{"l":0.490807133,"m":45.74307527,"s":0.028280585},"15.5":{"l":0.65193505,"m":45.98486901,"s":0.028314363},"16.5":{"l":0.803718086,"m":46.20857558,"s":0.028375159},"17.5":{"l":0.946259679,"m":46.41621635,"s":0.028459033},"18.5":{"l":1.079784984,"m":46.60950084,"s":0.028562759},"19.5":{"l":1.204602687,"m":46.78988722,"s":0.028683666},"20.5":{"l":1.321076285,"m":46.95862881,"s":0.028819525},"21.5":{"l":1.429602576,"m":47.11681039,"s":0.028968459},"22.5":{"l":1.530595677,"m":47.26537682,"s":0.029128879},"23.5":{"l":1.624475262,"m":47.40515585,"s":0.029299426},"24.5":{"l":1.71165803,"m":47.53687649,"s":0.029478937},"25.5":{"l":1.792551616,"m":47.66118396,"s":0.029666406},"26.5":{"l":1.867550375,"m":47.77865186,"s":0.02986096},"27.5":{"l":1.93703258,"m":47.8897923,"s":0.030061839},"28.5":{"l":2.001358669,"m":47.99506422,"s":0.030268375},"29.5":{"l":2.060870301,"m":48.09488048,"s":0.030479985},"30.5":{"l":2.115889982,"m":48.18961365,"s":0.03069615},"31.5":{"l":2.16672113,"m":48.2796011,"s":0.030916413},"32.5":{"l":2.21364844,"m":48.36514917,"s":0.031140368},"33.5":{"l":2.256943216,"m":48.44653703,"s":0.031367651},"34.5":{"l":2.296844024,"m":48.52401894,"s":0.031597939},"35.5":{"l":2.333589434,"m":48.59782828,"s":0.031830942},"36":{"l":2.350847202,"m":48.63342328,"s":0.031948378}}}
''';
