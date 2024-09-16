ModuleUUID = "8f23afc7-2354-42e0-844f-80445bf72f36"

function Get(ID_name)
	return Mods.BG3MCM.MCMAPI:GetSettingValue(ID_name, ModuleUUID)
end

function MergeUnique(table1, table2)
    local result = {}
    local seen = {}
    local function addValue(value)
        if not seen[value] then
            table.insert(result, value)
            seen[value] = true
        end
    end
    for _, value in ipairs(table1) do
        addValue(value)
    end
    for _, value in ipairs(table2) do
        addValue(value)
    end
    return result
end

Multi = 0
Dispensed = {}
Failed = 0
Haste_count = 0
CMND = 0
Sneaky_active = 0
Sneaky_break_count = 0
Charismatic = 0
Second_life = 0
Blessed = 0
Global_y = 0
IOU = 0
Free_roll = 0
REL_StatusesVars = {}
REL_Vars = {}
Return_to_sender = 0
Gold_MSG = "Your party suddenly feel a bit more wealthy"
Go_fast_MSG = "Waukeen has bought Labelas Enoreth's service, you suddenly feeeel eeeveeeeryyyythiiiing sloooooooweeeeer........"
Sneaky_MSG = "Waukeen has smugglers worship her, you now have an inkling of why."
Supercharged_MSG = "Impressed with your payment, Waukeen has personally Blessed you in your adventure."
Magical_jesus_MSG = "Waukeen has imbued you with a portion of her aspect, people now perform double takes when glancing at you."
Second_life_MSG = "Anything can be purchased with anything, Waukeen will completely restore you once if you are on the verge of death, and some more."
IOU_MSG = " A mysterious note with a green circle surrounding a skull appears before you: \"If you gather 13 coins onto your person, something magical will happen. Spend it quick, or waste it, you have one chance, preferably not near anyone you'll miss.\" -The note disintegrates right after you have read the last word."
Gacha_Exploit_MSG = "You intended to have your cake awhole and eat it too ? Be grateful Waukeen has not rescinded her blessings, you have forfeited one pass."
Status_Wiped_MSG = "For your expenditure of luck, Waukeen has given you 3 free passes to reach into any used chest yet again for something new. However, you will not receive any boons from Waukeen with these free passes."
Lunch_Money_Get_MSG = "Labelas Enoreth has taken offense at your manipulation of timelines just to obtain loot, He has taken liberty to lighten your pocket.";
Lunch_Money_Bypassed_MSG = "You thought you were clever removing all the gold in your inventory ? Labelas Enoreth has gifted your party some gold.";
Lunch_Money_Not_MSG = "Labelas Enoreth has taken offense at your manipulation of timelines for personal gains.";
Flesh_to_Gold_Reverted_MSG = "Labelas Enoreth has made sure his rules are adamantium-clad, but even the gods cannot overly intefere with mortal afairs, if your party manage to work out how His rules function and evade them, He shall not seek further retribution."
REL_ConfigFile = "REL_SE_Config.txt"
REL_Statuses = "REL_SE_Statuses.txt"
REL_ShadowRealm = "REL_SE_ShadowRealm.txt"
REL_Lootlist = "LootList.txt"
Shitty = {"h17976553gc896g4643gb06ag4a62f59fef20","h187af234g5438g4050gbee2g1d229c878be6","h18af59d3gd122g4d76gb718gad1b01c54184",
"h313d9cd8gcb9dg4da7ga368g9587a1679104","h357489cegd8d5g410eg95b2g97d8287b9ad7","h3b50d7a5gf953g4257gbf49gb9dd723e68ad",
"h4dfec4f3g853dg4137g9359g9b48d17d75ba","h5697c0a8g206bg4155g8947g26be543e08ff","h93641e6egf930g476cgacbdg8e614c7f4c1b",
"h9808b932g7dc2g464egbe05g567e9e0548b2","hb57896dcgc64cg4dc0gbca9g038f002cb535","hd17b3bf9g9359g4476g84b2g9eb9a2ff826e",
"hdafd441fg4e4cg4602g80f9geb1702e93d8f","he1374cc4g4d12g4293ga649gd69db1f8866c","he8c8e839g9ce1g45bfgba84g2eaddaf0f150",
"hf0beb07fg7a7bg4cd8ga3c9g73e62b22d6e7","hf4bae2f7gb6e8g4f8cgacf6g291a1f5a29ea","h6a9b3b32g6396g4aafg99edg9368df2421cb",
"h7bb9afb4g98c4g4519gbc23g03799679a8f1","h9317e1e3gfc5eg482ag8020g6e2277d16354","ha3590bc7g27b5g4d81g9a16g8d1e653cd787",
"haa175368g719bg4fd0g91dcgd8f64a61db06","hd80086a6g8d0bg4f08g87c0g3291a7b1d16b","hce8cc4edgd642g4a34gbab2g4f728d5ee534",
"h333df48eg4ec0g43f5ga51eg060507a3a745","h52cfff01ge443g4f2cg8879g046762a1db8e","hbf0be390g47d8g44c8g9012g76d639df51fe",
"h3d2577e9gffcbg4e4bgb004g576895a4db89","hc7bef1b3g3561g4d8fg91cfga9687e6d047d","hd80d1ac1gf828g4a60g92feg716f09b6cdf0",
"h0ef78b3ag313cg451ega242g56726a469132","h293c785dg91deg4a00gb757g708c998906cd","h6504e779g1851g4e27gbcf5g5a54d74ee54e",
"hf21020efgb616g4c79ga7b3gaddbb0c892df","h1f165d5fg6ae8g469ag812dg757ac3c86b53","h3604b9c7g2e0cg44b0g88dcgb19cbedd16f3",
"h7eb6cea8gada7g465fga9a1g333c157f6e77","h84a31f3ag029fg43e7g9c29g4366097db260","hb84e5ff3gf484g439dg81a1gb8c1004c2006",
"hfaea9b03g4668g4f17g9d21gc09dd13e3081","h63260877gc53ag4eefgbdd0g8f49f23b3aea",}

Ok = {"h0cbd6714g0052g438agb735g3983f72be4fe","h147514e7g7cb1g4f3dg9971g33e18dd9a05d","h2def6237g88a4g4da3g92cfgd2fb7db0e312",
"hb5583286gd86fg40a1ga231gb2fbc2d4d6f3","hbbc309d3g59f1g4884gb4aag67014ed91462","hf8f20e43gc9f5g4c86g9598gcd0e8a36a70d",
"hfb8f9f27g57b4g45dbg82aegf68b9772a7d6","h5bd4d94agdc2fg4260gaddeg36e53446d685","h48d19f91g535bg46d2g967fge0ad5e119212",
"heda8d26egfb09g4113gad26g5fa2b60a65c3","h180976f0g0e4cg4240g851cg5584e32029d2","ha92a806cgbda3g4d8bg84bega9350d424993",
"h42cf1b05g5c7cg45c4g86aeg77f3d26d069c","h6c9d8242g3ec9g4f49ga9c6gae77e563b90b","hebaec8d0ge9e4g4af8g9db9g5f4766c93433",
"hff071a90g3d26g459eg82a7g932988901d99","h5660455cg3d5cg4600g8df8g21f9ce119734","h4d4f5977g3020g4552gb192g21745e5370f0",
"h64f8fd00g50dcg4c9dg8656g1c5f05d29bc1","h660b3a69g7042g4d33gaf77g383ae21a27d2","h8fc9c16bg939ag4c7agb342gdb46d17fbae1",
"hd856662fg0f5eg4dedga623g7626c5b33800","h11e05f90g7baeg4dc1gbabcge8bb56b713bb","h1744771bg5a7bg4ef0g9426g6acaba8b8cd3",
"h7edb1dacg92fdg462bgafe7g5f9b53675940","ha04406bdg3ec3g47adgad0fg5c35deebfa05","he60628dag7e16g4c5dgb8cage8a6a3dabe61",
"h41c7f559gf54dg44eegbf7bga120b0564af2","h7ae27f0fg42c0g4f04gae76gb4e81fe47baa","hcdee071agfc9bg4caagb661g368bb54749fa",
"h7fb8cf17g605bg4a21gbc42g1329c379ccc6","he9b3208cg8347g40a2ga994gf287368adb89","h15cc1f5ag1841g4fb8ga914gf4c050ab900d",
"hd4f1ce4dg1945g4849gb848g838b76873ae3",}

Good = {"h09d80ebcg9d1fg4d43g85b0gdb0bd62ab079","h1e364f5eg4284g46c4g9337g640488392f7e","h201dadb4g9689g45baga115g0be24ab06ac0",
"h68d138f3gf5e7g44e7ga765g11d38b6886a0","h6d0c86e9g1334g462ag9135gdf65b0f746a0","h8b84795bg6560g4ab6gbca4g8e49bd3dcb27",
"h928998a4g317dg4e8dg8ca6gaa56645fd761","h9dd5cb1ag9659g4ee1g8bbegbe95416c7967","ha3bdd816g40a5g4edfgbab2g31612a3da7ae",
"ha79110a4ga594g4fdfg890bge8f570194aa5","hafb89c59gcc34g464ag9c4eg4539f6accb22","hc2f9ce16g00aag4755g9a5egeada47dac05e",
"hcb37303bg3d25g4fd2gaaf0g0a0e57e7ff19","hde142061g864bg4037g9c91gec820407a5f9","he1990708gaf30g424fga524gb23c96e36125",
"he82fd949geca6g4739ga115g9463b8d7b9d6","h071c628fg73e8g44aaga5d2g7beb90ab4645","h0b71551eg712bg4556g9a0dg9a5c8332c1be",
"h254eb416ge52ag4ba7ga7a3ge80099d2dde0","h69fee60dg6500g4afega16cg68217f1c935c","hef66271cg3de1g4a24gbc31g75d8b0c2d517",
"hf04a53cfg4467g4c92g8e07gf3710d64afdc","hf1c04abagf9c1g4de1gb61dgb23936783755","h1eeb2c44g49d7g4aa9g859dg1b69a433ecd8",
"hed6ffb9dgc443g462cg8c6fga6bf1ee216fb","h21935e9bg6edfg46bcg97b8g0d81c24b8294","h45242012g91a4g4056g8b6fg93ddcf32d82f",
"h73f35aebg2cf5g4857gbd16g9e9b40ac5387","h815107b4g6ca9g4016ga49agb28ff6d8a96f","h98b425afgd831g42e4gb5ebg5f8f1c3fff74",
"h9bc4dae7gc07eg466cga283g5baaa221cce7","h9f7c4ed0gd0cbg4a84g863dgff21c6c64add","h23d11290gad1bg4331g8978g629b99adf2b6",
"h243cb0acg7b29g4c83gab1bg4dc6cfb6a852","h3bc0263cgae28g47fdgb6efg0e60fa58b5e9","hb932a317g45fcg49fbgb52cg2ca137f9ca13",
"h5a593f3cgc63ag422bg93feg954ab7fc5c20","h63947db9g967fg427fg960fg49c13adff1a9","hc4fefb78ga9cfg49c6gb4deg585edb878753",
"h9e9b6fd9geb13g4078ga95ega9453101c34b","hc2ddc38bg2682g4529gb31eg8952ca19313e","hd744a168g299eg4758g8a50g09ac87b5a377",
"he9dd6a64g7d5fg40b6ga49cgb5db17d47fab","h2876c04bg2cf5g4470ga23agf22e3ab397cd","h76b03f47g6429g400cg82ccg87ca19a6cd1e",
"haa92650cg1573g47e5gb86fg8460e503320b",}

W_ok = {"h22f96aa2g5326g4b45g978eg58020860b579","h31c01e1eg1ac5g4895gaf92gae384668f9b0","h3ecad8b2gb034g4c99g8407g02aec91963ba",
		"h46d66402g020fg44ddg98eag1ae8694f22ad","h8cc84d3bg087dg437egab1fg0e55f9f37f19","hd0b70d07g1786g43cfgb78dgeafea8c0b0de"}

W_shitty = {"h2ceeba58g2250g4f73g9c7fgbc51b889fd3d","h5c062118gda0fg4ac3ga853g9656d6c78ec4","h8bbee0a7g752ag4102gbd28gef3787d378ca",
			"h8ef60a30gb174g455cga4aagb2793df64ea5"}

W_good = {"h0ae04ff2g6485g4c06ga1a5gff5118776b42","h2de5c3a1gdceag460agb730g1308e37f1c2e","h39f29767g474dg4d4cgb300g81e0f6762d10",
		"h79e79f4cg4d69g4b01g9eefgf97fb3210f5e","hb91abc7cgb5e0g484dga6ecg37487b28a7d1","hbdb79c1eg8e39g44e2gbb27ga1208a8c08ee",
		"hcf1d52d2g024ag48cfg9639gaafb96d72aae","h090c438dgc1b6g433fgb1ebg7232ad8f7680"}

Scroll = {"h0925ada5g277ag4eadg99b5ge0fcb2a1675d","h10582327g0533g4f9dg926bg2e9291de12e3","h1a1366a3g5719g4d8cg858bg10290ad5c0e0",
"h28ebbebbgff9dg4bd8ga566g5e4b8d2a279e","h4bf65cc2gfc82g4d2bg8e36g6cb5805bcaeb","h731a7145g157ag4513gbd4egd251adec8bcd",
"h96e66822gaeeag484bga5f7g124238a80ac1","had11ebdbg6de0g4e9bgbd30g439f6db8743c","hb5ed9ceagfc54g4d15gb5b5gce586a9a491f",
"hbeed65d0g4afcg4960g8d6agc27b1414769e","h172097c9g03d3g4ae6g973dgd1e8f62c171d","h29370794gc9e9g4a84gbf22g1a81da8c03de",
"h6c30942fg1f48g42c1gaabfg3ed14fa6f142","h71ec69begf331g4b87g839agf58caec1295e","h907d4c80g88e5g487bg9843g212763ebd424",
"ha0aebb5bg1b99g4525gbd5ag3fc6beea1f97","hd282cfb4g2493g41fdg9609gefece538a33b","hdbb86017gda2ag4e62g8480g6baf94245aa7",
"he8962dffg2f53g4b88g810dgf3b0a1084270","hfa298c80gca94g4cfag80c3gb2875c3a3df4","h0523479age5d4g49d5g8bfag17a44c809fa0",
"h0ad64a34g4fd6g45c1ga3a6ge1ed6298daaf","h2cca476egcd39g4b9agb413g9ba471000917","h39d70eb4g0002g4205g88f0g434f25bec741",
"h5c6456b4g7c9fg4634ga10bg662451d20478","h7daca3f9gd829g417bga96ege9f6571dafce","h8c3fa2bcgc78eg4d1aga75bgda86b42a2fc6",
"h9e681b6ag4497g486ag984bgb1d93e0b232e","h9f19b2d9ga279g4567g9355ga153243e9a45","haaefbff8gf9feg42b6g878eg0c3ae49446cf",
"hb00d6451g6039g41e2g9896gbbc50337460d","hb5b73e65g02a5g4bc2g802cga04dad8e7163","hc028df38gbe71g40a0gb5a6g399bd53df87b",
"hc7e7f983g5847g40dcgac13g7d416103b0f0","hd15eeb7agbb8ag4869gb3c0g1c9e07d72c67","hdb6b5840g9087g42d9gb3b3g23c9e4100260",
"hedf53848g79d3g41fegbd7fg1ea5c79f21c5","hf640f1beg6bf1g4fa8gb26eg38ef8295254b","h02ed06a0ge396g4eb3gab3egc41c3cb28ec2",
"h2a74d7f3ge10cg4b7eg9919g5858bf9658fd","h365cc98eg3404g45d1gbc77g0b2313fc6532","h3f893be2g9cf0g41dcgb52bg11af2c0222a9",
"h45ce6041ga166g4c11ga9bcg396dfbaa3cca","h46894ba3g4087g4f83g96a5g4cd743d0fd2b","h4ea72421gc0ecg48e7g89dege6916f8a23db",
"h500ad49agc2ceg44a3ga3cagd5feda8b0d1d","h535ba34bgb061g47c5g93a5g2c8a51702418","h5e8b301dg9958g4f2fg8efegce6fd05102ba",
"h602c9cbege34dg456ag8011g6b2255713431","hb54a3a47g126fg4c04g966cg0e93b637a014","hceadb0c4gf82eg44a5gb1f8g47cf25ad9720",
"hd6909f49gbdd0g4c5fg86bfg752c53346995","hed66b2f8g386cg4c42g9bfcgeec1e3db74d6","hfa4d046ag2f6ag4878g94ddgaab2fef8de31",
"h0b18a93dg6328g4064gaf8egeb25aecae7b1","h4c63fa09g9d83g4bfcgb62ag4f6f6f62280c","h584ac924g4dc6g445aga9f3g7b76e3d3ed2e",
"h5a81dad1gf576g4dbfgb3f5g0eb643b905a0","he74e3708g4339g46e0gbc9agd2e84889e464","h30d86308g68ffg4c2egb9degfc82e6a47818",
"h4235d5bdg1cd7g4bdfgb820g34446f052865","h8db3b802g23a5g44ddgb139gb64d5c1d07e4","hb2878589g0fb8g4401g8f54g39682547f5d6",
"hbbce44f7g22b2g4792g9309gf47a9b5321de","hbf31d89eg5438g4e69gb136g0734c2abd067","hcc57dcd6g008ag4190ga930gcbcaaf08d753",
"hd0b24c8bga35dg4fd3g9582g78fea6062b2f","hef40e6cfg5070g4de6g9c41g4b49eaacad64","hffb743a5gbc6fg4f75ga15bgbb46b0c7db46",
"h047b5294g10fag4233ga1adg658510f8c48e","h07608f66g6b37g47adg931fg167561d9e7a5","h31d1fea4g1985g4f93ga8b3gc36d66d07786",
"h3bfee788g801fg413dg96bcge2b1cb01e628","h3def8f14gcd23g40a8g96f7g464c88776e60","h51baaaa8gb8ebg4cf4gbd59gf8d8b6da43ff",
"h6bba1877g07dcg47e9g9032g2c28c84e356a","h70c3425agc67bg4896gb84bg8e5f8c9e4a9f","h71c16d12gc9a1g40a6g81dcg7f5e5911645a",
"ha5506f8bgf582g43dag9981g0b0abb15d6c7","hbb0b52e5g2964g4931gbad6g327b8c21d347","hc0b3169cgb1f6g4dc5ga26fg419fbe34f54d",
"hc8995b2cg55e2g4345g8bfegbc703325e987","h0ee043beg6863g42afg9184ga6d38c03bb13","h2260806ag2cfbg4163g9855g7144af2bea53",
"h3ed2f112g5218g48ebg8b7fg453205436dbb","h4546de7cg883eg4d07gb4abg7762e73e1a70","h4c59e190gab4fg43a8g83bcg6bcdfac5e936",
"h4e6da9c6ge4fcg4b56g81ebga6b99cbeb442","h5d657d76g90d6g4aefg8445g96b8dcb06a04","h77e35501g8ac3g418cgbbabgb4b59b4d47ea",
"h9cfa1018ga7a1g4abcgab24g5ea36f494817","hb92c19e4gf158g477eg8631gb05ddb7f3971","hbd3ae598g8b9cg43dbga926g0b11172a54e6",
"hc29e4e61g13a4g45c6g8c1egd24a48599fda","hf47eb40eg4f3cg47c4g8517g2758f35171fe",
}

Bottle = {"h11f03870gfb88g47e5g905dg787b74cb6770","h14c47f76gbc5dg4361gbbfbg719ac6fa49a3","h2d1626d2gdaf4g47f7gacb5gd6b7d4aa1bdb",
"h3b5817e7g3ce9g481eg890dge4c705481d87","h4bc732d2gfad8g4ac7gb951g5ed2d1403b28","h5d44422eg6015g41bbgb33agc7d76fa3e97b",
"h620e4b80g6e65g4e0cgb1degdad99d1104ab","h6a4d79cdga310g4c32gaeb2gfa0ed7906b55","h9207ad2ega5d4g4a82gb7dfgbbdd5c1439c5",
"h9e717037g437dg4782gae14g614a38a73e09","hbcff839eg3874g4ef6g9242g86dbbe4d8680","hdc0413bag8885g45c4gae3eg61a98ca0f4a5",
"hfcbc2b84gac29g4955g8583g090351cba242","h05ed63bcg9c2dg4043gaef2g0d38f97f20c0","h13977beegef57g4b67gae34g6e44a2953358",
"h43a5acafg6978g4ae1ga621g1675000bebaf","h555fa456g38ecg4361g832fgc11e31170d4d","h3db90015ge9cfg4a41gb1fcg82eddeeaf67a",
"h62c4efb5gd5aag487fg882dg395204435283","h778732f5ga802g4a52gae9fgd429c6d8fa69","h7c46d59bg542eg45f6ga350gff032bdbb00a",
"h991f8985g909eg406fg8fe3g7b4617866543","hae18e5d9g258fg49c2g942bg46d3be630074","hbc3a4442gdba8g4a43g9b4ag0f5287e5ea4d",
"he8354518g3978g4336g831bg2b3752ee52f8","he87a74fcg88e5g4f0bg90d2g9e209e3939d8","h3e3917ceg82fag4626gb64bg3153cc381f8b",
"h3e7e1006g3af4g4b3bgaa59g08ade4127b6c","h611a3fe3gc620g405ag97f9g8d0dbc259187","h65f6ca19gfeb5g44c4g94c5g7fa3405de7d7",
"h8977c663g0fbeg4b5cgb521gf778ffea9aae","hb4b74929gd846g4e93g8514g549a6e6f7fa3","hb7394451g0ab7g4b2agb7dfge4a580e9c278",
"hcdf1a0f0g9d78g404fgada7ga90cabd1242c","hce3c7fa4g04d5g4f1eg9496ge574168eeb4c","hd76ada48g15a5g4e86ga991g54dfa1ab1e71",
"hec9d224cgc2d3g4a48gbe5ege55c6db92267","hf3b9195dga253g41bag860fg96273c2735de","hcb619ed9g504bg4063g83d8g45da5baa42dd",
"h334bc10cg8ed0g4400ga69bgaae60cc16fa9",}

Arrow = {"h810d6e55gaf8fg4494ga618g1fab2f4f4d80","h0bbb1abage525g4cc6gb0b8ge1b2383cfc41","h233743e5gda3fg4103g89e4gae673fbe88f0",
		"h38f109d2g2812g47e0g9dcbge34b2cd77eb6","h3b481d68ge781g4a1fgb108gd43db1e398a6","had2ebd7eg5166g4ddfga860gaf704444b5d2",
		"hbda9e773g8b5ag4cf1ga193g962629a7aaef","hd0a7be8age9aeg46e2g80bcg24415ec18d74","hd789c6b7g3087g4efbg83feg402433b62521",
		"hfe8308c0gcad6g4afcg93b1gfa236db0e11f",}

Acts = {Tutorial = "TUT_Avernus_C",
		Wilderness = "WLD_Main_A",
		Creche = "CRE_Main_A",
		Shadowland = "SCL_Main_A",
		Outskirt = "BGO_Main_A",
		City = "CTY_Main_A",
		HighHall = "END_Main",
		Lookout = "INT_Main_A",
		IronThrone = "IRN_Main_A"
		}

function FindAct(input)
    local output = nil
    for key, act in pairs(Acts) do
        for _, prefix in ipairs(act) do
            if prefix == input then
                output = key
            end
        end
    end
    return output
end

Consumable = {Bottle = Bottle, Scroll = Scroll, Arrow = Arrow}
Wardrobes = {Shabby = W_shitty, Normal = W_ok, Mahogany = W_good}
Chests = {[1] = Shitty, [2] = Ok, [3] = Good}
Container = {Chest = Chests, Wardrobe = Wardrobes, Bottle = Bottle, Scroll = Scroll, Arrow = Arrow}
Slot_list = {"MeleeMainHand", "Helmet", "Breast", "Cloak", "MeleeOffHand","RangedMainHand",
			 "RangedOffHand","Ring", "Boots", "Gloves", "Amulet", "Ring2", "MusicalInstrument"}

function ExtractStrings(filename,criteria)
    local file = Ext.IO.LoadFile(filename)
	local lines = {}
	if not file then
	else
    	for line in string.gmatch(file,criteria) do
        	table.insert(lines,line) 
		end
	end
    return lines
end

function GetCategory(tbl, value, outer_or_inner)
	local function searchTable(value, tbl)
        for name, subtable in pairs(tbl) do
            if type(subtable) == "table" then
				local result = searchTable(value, subtable)
                if result then
                    return name
                end
            elseif subtable == value then
                return name
            end
        end
	end
    for name, subtable in pairs(tbl) do
        if type(subtable) == "table" then
            if outer_or_inner then
                if searchTable(value, subtable) then
                    return name
                end
            else
                local result = searchTable(value, subtable)
                if result then
                    return result
                end
            end
        end
    end
end

-- extract item name, uuid, and rarity
Names = ExtractStrings(REL_Lootlist, "%-%-(.-)%-%-")
UUIDS = ExtractStrings(REL_Lootlist, "%+%+(.-)%+%+")
Rarities = ExtractStrings(REL_Lootlist,"<(.-)>")
Types = ExtractStrings(REL_Lootlist,"#(.-)#")
Act = ExtractStrings(REL_Lootlist,"!(.-)!")
-- make a meta list of any item
BigList = {}
for i = 1, #Names do
	if not Act[i] then
		Act[i] = " "
	end
	table.insert(BigList, {
		item_rarity = Rarities[i],
		item_name = Names[i],
		item_uuid = UUIDS[i],
		item_type = Types[i],
		item_act = Act[i]
	})
end

Looted_names = ExtractStrings(REL_ShadowRealm, "%-%-(.-)%-%-")
Looted_UUIDS = ExtractStrings(REL_ShadowRealm, "%+%+(.-)%+%+")
Looted_rarities = ExtractStrings(REL_ShadowRealm,"<(.-)>")
Looted_types = ExtractStrings(REL_ShadowRealm,"#(.-)#")
Looted_acts = ExtractStrings(REL_ShadowRealm,"!(.-)!")


function GetDifferenceIndices(largeTable, smallTable)
    local smallSet = {}
    for _, value in ipairs(smallTable) do
        smallSet[value] = true
    end

    local differenceIndices = {}
    for index, value in ipairs(largeTable) do
        if not smallSet[value.item_name] then
            table.insert(differenceIndices, index)
        end
    end

    return differenceIndices
end

function REL_ResetStatuses()
	local REL_vrs = "Victim=" ..(Victim or 0)..
	"\nsneakyactive=" .. (Sneaky_active or 0) ..
	"\nsneakybreakcount=" .. (Sneaky_break_count or 0) ..
	"\nCharismatic=" .. (Charismatic or 0) ..
	"\nsecondlife=" .. (Second_life or 0) ..
	"\nIOU=" .. (IOU or 0) ..
	"\nfreeroll=" .. (Free_roll or 0) ..
	"\nhastecount=" .. (Haste_count or 0)..
	"\nBlessed=" .. (Blessed or 0)..
	"\nGlobaly=" .. (Global_y or 0)..
	"\nCMND=" .. (CMND or 0)
	Ext.IO.SaveFile(REL_Statuses,REL_vrs)
end

function REL_GetStatusesVars()
	REL_StatusesVars = {}
	REL_LoadStatuses = Ext.IO.LoadFile(REL_Statuses)
	if (not REL_LoadStatuses) then
		print("Creating " .. REL_Statuses .. " configuration file.")
		REL_ResetStatuses()
		REL_LoadStatuses = Ext.IO.LoadFile(REL_Statuses)	
	end
	for k, v in string.gmatch(REL_LoadStatuses, "(%a+)=([%w%-{}]+)") do
		if(tostring(k)=="nil" or tostring(v)=="nil" or k == "" or v == "") then
			break
		end
		REL_StatusesVars[k] = v		  
	end
end

function REL_GetStatusesConfig() 
	REL_GetStatusesVars()
	print("Configuration file: " .. REL_Statuses .. " loaded")
	Victim = REL_StatusesVars["Victim"]
	Sneaky_active = tonumber(REL_StatusesVars["sneakyactive"])
	Sneaky_break_count = tonumber(REL_StatusesVars["sneakybreakcount"])
	Charismatic = REL_StatusesVars["Charismatic"]
	Second_life = tonumber(REL_StatusesVars["secondlife"])
	IOU = REL_StatusesVars["IOU"]
	Free_roll = tonumber(REL_StatusesVars["freeroll"])
	Haste_count = tonumber(REL_StatusesVars["hastecount"])
	Blessed = REL_StatusesVars["Blessed"]
	Global_y = tonumber(REL_StatusesVars["Globaly"])
	CMND = REL_StatusesVars["CMND"]
end

function GetAnyContainerQuality()
	local anyC = Get("AnyContainer")
	if string.find(anyC, "Global") then
		return 
	elseif string.find(anyC, "Poor") then
		return "1"
	elseif string.find(anyC, "Ok") then
		return "2"
	elseif string.find(anyC, "Good") then
		return "3"
	end
end

function GetAnyContainerType()
	local anyC = Get("AnyContainer")
	if string.find(anyC, "Global") then
		return "HH"
	else
		return "C"
	end
end

function Rescaling(max_value, u, r, v, l)
	local sum = u+r+v+l
	local scale = max_value/sum
	return u*scale, r*scale, v*scale, l*scale
end

function Check_and_fix()
	if #BigList ~= #Names then
		BigList = {}
		for i = 1, #Names do
			if not Act[i] then
				Act[i] = " "
			end
			table.insert(BigList, {
				item_rarity = Rarities[i],
				item_name = Names[i],
				item_uuid = UUIDS[i],
				item_type = Types[i],
				item_act = Act[i]
			})
		end
	end
end

function UniqueValues(tbl)
    local uniqueTbl = {} 
    local seen = {}       
    for _, value in ipairs(tbl) do
        if not seen[value] then
            table.insert(uniqueTbl, value)
            seen[value] = true
        end
    end
    return uniqueTbl
end

function CountInstances(table, value)
	local count = 0
	for _, v in pairs(table) do
		if v == value then
			count = count + 1
		end
	end
	return count
end

function FindIndices(tbl, value)
    local indices = {}
    for i, v in ipairs(tbl) do
        if v == value then
            table.insert(indices, i)
        end
    end
    return indices
end

function FindIndices2(tbl1, value1, tbl2 ,value2)
	local indices = {}
	for k, v in ipairs(tbl1) do
		if v == value1 and tbl2[k] == value2 then
			table.insert(indices,k)
		end
	end
	return indices
end

function FindIndicesSub(tbl, value, tbl_sub_name)
	local result = nil
	for i, v in ipairs(tbl) do
		if v[tbl_sub_name] == value then
			result = i
			break
		end
	end
	return result
end

function GetUniqueGears(inventoryHolder, custom)
	local list = {}
	for i = 1,2 do
		if custom == "Sacrifice" then
			if Ext.Entity.Get(inventoryHolder).InventoryOwner.Inventories[i] then
				local pulled_list = Ext.Entity.Get(inventoryHolder).InventoryOwner.Inventories[i].InventoryContainer.Items
				for _, v in pairs(pulled_list) do
					if IsEquipable(v.Item.Uuid.EntityUuid) == 1 and
					v.Item.Value.Rarity > 0 and (not string.find(tostring(v.Item.ServerItem.Flags),"StoryItem")) then
						table.insert(list,v.Item)
					end
				end
			end
		else
			if Ext.Entity.Get(inventoryHolder).InventoryOwner.Inventories[i] then
				local pulled_list = Ext.Entity.Get(inventoryHolder).InventoryOwner.Inventories[i].InventoryContainer.Items
				for _, v in pairs(pulled_list) do
					if IsEquipable(v.Item.Uuid.EntityUuid) == 1 and v.Item.Value.Unique and
					v.Item.Value.Rarity > 0 and (not string.find(tostring(v.Item.ServerItem.Flags),"StoryItem")) then
						table.insert(list,v.Item)
					end
				end
			end
		end
	end
	if custom == "Camp" then
		local record = Osi.DB_Camp_UserCampChest:Get(nil, nil)
		local player_chestID = {}
		for _, v in pairs(record) do
			table.insert(player_chestID,v[2])
		end
		return list, player_chestID
	elseif custom == "Consumable" then
		for _, v in pairs(list) do
			if IsConsumable(v.Uuid.EntityUuid) == 1 and (not string.find(tostring(v.ServerItem.Flags),"StoryItem"))  then
				table.insert(list,v.Item)
			end
		end
		return list
	else
		return list
	end
end

function CompareRate(a, b)
	return a.type_rate < b.type_rate
end

function Alphabetical_Visual(a, b)
	return a.GameObjectVisual.RootTemplateId < b.GameObjectVisual.RootTemplateId
end

function Serialize(o)
    local s = ""
    for _, v in pairs(o) do
   	 s = s .. tostring(v) .. ",\n"
	end
    return s
end

function Write_and_save(file_name, name_list, UUID_list, Rarity_list, Type_list, Act_list)
	local outputFile = {}
	local seen = {}
	for i = 1, #name_list do
		local uuid = UUID_list[i]
		if not seen[uuid] then
			seen[uuid] = true
			if not Act_list[i] then
				Act_list[i] = " "
			end
			if i == 1 and i == #name_list then
				table.insert(outputFile, "\"--"..name_list[i].."-- ++"..UUID_list[i].."++ <"..Rarity_list[i].."> #"..Type_list[i].."# !"..Act_list[i].."!\"")
			elseif i == 1 then
				table.insert(outputFile, "--"..name_list[i].."-- ++"..UUID_list[i].."++ <"..Rarity_list[i].."> #"..Type_list[i].."# !"..Act_list[i].."!\"")
			elseif i == #name_list then
				table.insert(outputFile, "\"--"..name_list[i].."-- ++"..UUID_list[i].."++ <"..Rarity_list[i].."> #"..Type_list[i].."# !"..Act_list[i].."!")
			else
				table.insert(outputFile, "\"--"..name_list[i].."-- ++"..UUID_list[i].."++ <"..Rarity_list[i].."> #"..Type_list[i].."# !"..Act_list[i].."!\"")
			end
		end
	end
	local export = Serialize(outputFile)
	Ext.IO.SaveFile(file_name, export)
end

function Scale_Weighted_roll(table)
	local internal = table
	local cur_sum = 0
	for _,v in ipairs(internal) do
		cur_sum = cur_sum + v.type_rate
	end
	if cur_sum == 0 then
		return
	end
	local factor = 100 / cur_sum
	for _,v in ipairs(internal) do
		v.type_rate = v.type_rate * factor
	end
	return internal
end

function Weighted_roll(tbl)
	local cumulative = 0
	local Type_roll = math.random(1, 100)
	local Result = nil
	local table_num = 0
	local adjusted = Scale_Weighted_roll(tbl) or tbl
	for _,v in pairs(adjusted) do
		if type(v) == "table" then
			table_num = table_num + 1
		end
	end
	for i = 1, table_num do
		cumulative = cumulative + adjusted[i].type_rate
		if Type_roll <= cumulative then
			Result = adjusted[i].type_name
			break
		end
	end
	return Result
end

function Count_entries(tbl)
	local count = 0
	for _, v in pairs(tbl) do
		if type(v) == "table" then
			count = count + Count_entries(v)
		else
			count = count + 1
		end
	end
	return count
end

function Generate_cosmetic(ID2, Cosmetic_rate)
	if not Get("CosmeticVisible") then
		return
	end
	Check_and_fix()
	Looted_names = ExtractStrings(REL_ShadowRealm, "%-%-(.-)%-%-")
	Looted_UUIDS = ExtractStrings(REL_ShadowRealm, "%+%+(.-)%+%+")
	Looted_rarities = ExtractStrings(REL_ShadowRealm,"<(.-)>")
	Looted_types = ExtractStrings(REL_ShadowRealm,"#(.-)#")
	Looted_acts = ExtractStrings(REL_ShadowRealm,"!(.-)!")
	Cosmetic_rate = Cosmetic_rate*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
	if Cosmetic_rate == 0 then
		return
	end
	print("[REL_SE] Cosmetic_rate adjusted "..Cosmetic_rate*100)
	local Dicesize = math.floor(math.exp(Get("Dicesize") * math.log(10)))
	local Dice_roll = math.random(1, Dicesize )
	print("[REL_SE] Cosmetic rolled "..Dice_roll.." out of "..Dicesize)
	local cosmetic = FindIndices(Rarities, "cosmetic")
	if #cosmetic == 0 then
		print("[REL_SE] No more cosmetic item in Lootlist.txt")
		return nil
	end
	local ticket = nil
	if Dice_roll <= Cosmetic_rate*Dicesize and #cosmetic > 0 then
		ticket = cosmetic[math.random(1,#cosmetic)]
	end
	if ticket then
		Failed = 0
		local treasure = BigList[ticket].item_uuid
		print("[REL_SE] Cosmetic Item distributed: "..BigList[ticket].item_name.." "..BigList[ticket].item_rarity.." "..BigList[ticket].item_type)
		TemplateAddTo(treasure,ID2,1,0)
		if not Get("Duplicate") then
			if Get("Unique_Cosmetic") then
				table.insert(Looted_names, Names[ticket])
				table.insert(Looted_rarities, Rarities[ticket])
				table.insert(Looted_UUIDS, UUIDS[ticket])
				table.insert(Looted_types, Types[ticket])
				if not Act[ticket] then
					for i = 1,ticket do
						Act[i] = " "
					end
				end
				table.insert(Looted_acts,Act[ticket])
				table.remove(Act,ticket)
				table.remove(Names, ticket)
				table.remove(Rarities, ticket)
				table.remove(UUIDS, ticket)
				table.remove(Types, ticket)
				Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
				Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
				table.insert(Mods.REL_SE.PersistentVars.Dropped,treasure)
			end
		end
	else
		print("[REL_SE] No cosmetic for "..ID2)
		Failed = 1
	end
	if IsContainer(ID2) == 1 or IsDead(ID2) == 1 or Osi.HasActiveStatus(ID2, "KNOCKED_OUT") == 1 then
		ApplyStatus(ID2, "LOOT_DISTRIBUTED_OBJECT",-1)
	elseif IsTradable(ID2) == 1 or CanTrade(ID2) == 1 then
		ApplyStatus(ID2, "LOOT_DISTRIBUTED_TRADER",-1)
	end
end

function Generate_stuff(ID2, stuff_name, typ)
	if not Get("ConsumbleVisible") then
		return
	end
	Check_and_fix()
	local stuff_type = string.upper(string.sub(stuff_name,1,1))
	local u = Get(stuff_type .. "_uncommon")*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
	local r = Get(stuff_type .. "_rare")*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
	local v = Get(stuff_type .. "_veryrare")*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
	local c = Get(stuff_type .. "_common")*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
	if u == 0 and r == 0 and v == 0 and c == 0 then
		return nil
	end
	if Get("enableScaling") then
		c,u,r,v = Rescaling(Get("maxTotal")/100, c,u,r,v)
	elseif (c+u+r+v) > 1 then
		c,u,r,v = Rescaling(1, c,u,r,v)
	end
	local typ_rate = Get(typ .. "_UsableRate")
	c = c*(typ_rate/100)
	u = u*(typ_rate/100)
	r = r*(typ_rate/100)
	v = v*(typ_rate/100)
	local time = 0
	local total_count = Get(stuff_type .. "_total_count")
	if total_count == 0 then
		return
	end
	local rate_mult = Get(stuff_type .. "_Rate_Multiplier")
	local ignore_fail = Get(stuff_type .. "_IgnoreFail")
	local success = 0
	while total_count > time do
		time = time + 1
		if success == 1 then
			c = c*(1-rate_mult/100)
			u = u*(1-rate_mult/100)
			r = r*(1-rate_mult/100)
			v = v*(1-rate_mult/100)
		end
		success = 0
		local Dicesize = math.floor(math.exp(Get("Dicesize") * math.log(10)))
		local Dice_roll = math.random(1, Dicesize)
		local ticket = nil
		local treasure = nil
		local index = FindIndices(Types,stuff_name)
		if #index == 0 then
			return
		end
		local common = FindIndices2(Rarities, "uncommon",Types, stuff_name)
		local uncommon = FindIndices2(Rarities, "rare",Types, stuff_name)
		local rare = FindIndices2(Rarities, "very rare",Types, stuff_name)
		local very_rare = FindIndices2(Rarities, "legendary",Types, stuff_name)
		local heal = false
		if #common == 0 or #uncommon == 0 or #rare == 0 or #very_rare == 0 or total_count <= 0 then
		return
		end
		print("[REL_SE] Rolled "..Dice_roll.." out of "..Dicesize.." for "..stuff_name)
		if stuff_name == "potion" then
			local Dice = math.random(1,10000)
			if Dice <= Get("P_HealingRate")*100 then
				heal = true
			end
		end
		if Dice_roll <= v*Dicesize then
			ticket = very_rare[math.random(1,#very_rare)]
		elseif Dice_roll <= (v+r)*Dicesize then 
			ticket = rare[math.random(1,#rare)]
		elseif Dice_roll <= (r+v+u)*Dicesize then
			ticket = uncommon[math.random(1,#uncommon)]
		elseif Dice_roll <= (u+r+v+c)*Dicesize then 
			ticket = common[math.random(1,#common)]
		end
		if not ticket then
			print("[REL_SE] You did not get a usable item, better luck next time")
			print("[REL_SE] Chance Array "..(c*100).." "..(u*100).." "..(r*100).." "..v*100)
			if not ignore_fail then
				break
			end 
		else
			success = 1
			treasure = BigList[ticket].item_uuid
			if heal then
				if Dice_roll <= v*Dicesize then
					treasure = "7d78f227-e8d4-486d-8121-25cf0bee751d"
				elseif Dice_roll <= (v+r)*Dicesize then
					treasure = "df4f3495-abaf-4732-b82f-55bcccd561db"
				elseif Dice_roll <= (r+v+u)*Dicesize then
					treasure = "e3b95c96-dc26-40fe-bfc0-baa05e1abd20"
				else
					treasure = "d47006e9-8a51-453d-b200-9e0d42e9bbab"
				end
			elseif not heal and stuff_name == "potion" then
				if treasure == "7d78f227-e8d4-486d-8121-25cf0bee751d" then
					repeat
						ticket = very_rare[math.random(1,#very_rare)]
					until BigList[ticket].item_uuid ~= "7d78f227-e8d4-486d-8121-25cf0bee751d"
					treasure = BigList[ticket].item_uuid
				elseif treasure == "df4f3495-abaf-4732-b82f-55bcccd561db" then
					repeat
						ticket = rare[math.random(1,#rare)]
					until BigList[ticket].item_uuid ~= "df4f3495-abaf-4732-b82f-55bcccd561db"
					treasure = BigList[ticket].item_uuid
				elseif treasure == "e3b95c96-dc26-40fe-bfc0-baa05e1abd20" then
					repeat
						ticket = uncommon[math.random(1,#uncommon)]
					until BigList[ticket].item_uuid ~= "e3b95c96-dc26-40fe-bfc0-baa05e1abd20"
					treasure = BigList[ticket].item_uuid
				elseif treasure == "d47006e9-8a51-453d-b200-9e0d42e9bbab" then
					repeat
						ticket = common[math.random(1,#common)]
					until BigList[ticket].item_uuid ~= "d47006e9-8a51-453d-b200-9e0d42e9bbab"
					treasure = BigList[ticket].item_uuid
				end
			end
			print("[REL_SE] Item distributed: "..BigList[ticket].item_name)
			print("[REL_SE] Chance Array "..(c*100).." "..(u*100).." "..(r*100).." "..v*100)
			TemplateAddTo(treasure,ID2,1,0)
		end
	end
	if IsContainer(ID2) == 1 or IsDead(ID2) == 1 or Osi.HasActiveStatus(ID2, "KNOCKED_OUT") == 1 then
		ApplyStatus(ID2, "LOOT_DISTRIBUTED_OBJECT",-1)
	elseif IsTradable(ID2) == 1 or CanTrade(ID2) == 1 then
		ApplyStatus(ID2, "LOOT_DISTRIBUTED_TRADER",-1)
	end
	print("[REL_SE] Name "..ResolveTranslatedString(GetDisplayName(ID2)))
	print("[REL_SE] Chance Array "..(c*100).." "..(u*100).." "..(r*100).." "..v*100)
end

function Generate_loot(ID2, u, r, v, l, bypassed,differentType)
	Check_and_fix()
	if not bypassed then
		if not Mods.REL_SE.PersistentVars.Misc.PityCount then
			Mods.REL_SE.PersistentVars.Misc.PityCount = 0
		end
		u = u*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
		r = r*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
		v = v*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
		l = l*(1+Get("enableRandomizedChance")*(math.random() * (Get("max") - Get("min")) + Get("min")))/100
		if Get("enableScaling") then
			u,r,v,l = Rescaling(Get("maxTotal")/100, u,r,v,l)
		elseif (u+r+v+l) > 1 then
			u,r,v,l = Rescaling(1, u,r,v,l)
		end
	end
	local Dicesize = math.floor(math.exp(Get("Dicesize") * math.log(10)))
	local Dice_roll = math.random(1, Dicesize)
	local ticket = nil
	local types = {}
	local Result = nil
	Generate_weight_list()
	local lottery = {}
	for i = 1, #Rarity_list do
		if Rarity_list[i] ~= "cosmetic" then
			lottery[Rarity_list[i]] = {}
			for k = 1, #Type_list do
				lottery[Rarity_list[i]][Type_list[k]] = {}
				if not types[Type_list[k]] then
					table.insert(types,Type_list[k])
				end
				for j = 1, #BigList do
					if BigList[j].item_rarity == Rarity_list[i] and BigList[j].item_type == Type_list[k] then
						table.insert(lottery[Rarity_list[i]][Type_list[k]], j)
					end
				end
			end
		end
	end
	local loop = 0
	::reroll_loot::
	loop = loop + 1
	local type_list = Assorted_Type_list
	local list_count = 0
	for _, x in pairs(type_list) do
		if type(x) == "table" then
			list_count = list_count + 1
		end
	end
	if list_count == 0 then
		print("[REL_SE] No more unique item exists within LootList.txt . Please add more items using the Generator, or inform Eumeta if this statement is false.")
		return
	end
	if Get("EnableWeightedTypeDrop") then
		Result  = Weighted_roll(type_list)
	else
		Result = type_list[math.random(1,list_count)].type_name
	end
	print("[REL_SE] Rolled "..Dice_roll.." out of "..Dicesize.." for unique item")
	if (Dice_roll <= l*Dicesize and lottery.legendary and Count_entries(lottery.legendary) > 0) or
	(not bypassed and Get("Pity") and Get("PityCount") <= Mods.REL_SE.PersistentVars.Misc.PityCount) then -- distribute legendary item
		if  #lottery.legendary[Result] == 0 then
			repeat
				print("[REL_SE] Can't find a legendary "..Result.." in the loot list, rerolling to other categories...")
				list_count = list_count - 1
				table.remove(type_list,FindIndicesSub(type_list,Result,"type_name"))
				if Get("EnableWeightedTypeDrop") then
					Result  = Weighted_roll(type_list)
				elseif list_count > 0 then
					Result = type_list[math.random(1,list_count)].type_name
				end
			until #lottery.legendary[Result] > 0 or list_count <= 1
			print("[REL_SE] "..Result)
		end
		ticket = lottery.legendary[Result][math.random(1, #lottery.legendary[Result])]
	elseif Dice_roll <= (v+l)*Dicesize and lottery["very rare"] and Count_entries(lottery["very rare"]) >0 then -- distribute very rare item
		if #lottery["very rare"][Result] == 0 then
			repeat
				print("[REL_SE] Can't find an Epic "..Result.." in the loot list, rerolling to other categories...")
				list_count = list_count - 1
				table.remove(type_list,FindIndicesSub(type_list,Result,"type_name"))
				if Get("EnableWeightedTypeDrop") then
					Result  = Weighted_roll(type_list)
				elseif list_count > 0 then
					Result = type_list[math.random(1,list_count)].type_name
				end
			until #lottery["very rare"][Result] > 0 or list_count <= 1
			print("[REL_SE] "..Result)
		end
		ticket = lottery["very rare"][Result][math.random(1, #lottery["very rare"][Result])]
	elseif Dice_roll <= (r+v+l)*Dicesize and lottery.rare and Count_entries(lottery.rare) > 0 then -- distribute rare item
		if #lottery.rare[Result] == 0 then
			repeat
				print("[REL_SE] Can't find a rare "..Result.." in the loot list, rerolling to other categories...")
				list_count = list_count - 1
				table.remove(type_list,FindIndicesSub(type_list,Result,"type_name"))
				if Get("EnableWeightedTypeDrop") then
					Result  = Weighted_roll(type_list)
				elseif list_count > 0 then
					Result = type_list[math.random(1,list_count)].type_name
				end
			until #lottery.rare[Result] > 0 or list_count <= 1
			print("[REL_SE] "..Result)
		end
		ticket = lottery.rare[Result][math.random(1, #lottery.rare[Result])]
	elseif Dice_roll <= (u+r+v+l)*Dicesize and lottery.uncommon and Count_entries(lottery.uncommon) > 0 then -- distribute uncommon item
		if #lottery.uncommon[Result] == 0 then
			repeat
				print("[REL_SE] Can't find an uncommon "..Result.." in the loot list, rerolling to other categories...")
				list_count = list_count - 1
				table.remove(type_list,FindIndicesSub(type_list,Result,"type_name"))
				if Get("EnableWeightedTypeDrop") then
					Result  = Weighted_roll(type_list)
				elseif list_count > 0 then 
					Result = type_list[math.random(1,list_count)].type_name
				end
			until #lottery.uncommon[Result] > 0 or list_count <= 1
			print("[REL_SE] "..Result)
		end
		ticket = lottery.uncommon[Result][math.random(1, #lottery.uncommon[Result])]
	end
	if ticket and BigList[ticket].item_act and BigList[ticket].item_act ~= " " and 
	BigList[ticket].item_act ~= FindAct(GetRegion(GetHostCharacter())) and loop <= 500 then
		goto reroll_loot
	end
	if not ticket then
		if  Get("Pity") and not bypassed and l > 0 then
			Mods.REL_SE.PersistentVars.Misc.PityCount = Mods.REL_SE.PersistentVars.Misc.PityCount + 1
			print("[REL_SE] Pity Count: "..Mods.REL_SE.PersistentVars.Misc.PityCount)
		end
		Failed = 1
		print("[REL_SE] You did not get a loot, better luck next time")
		if Get("EnableInsurance") and (r+v+l+u)*100 <= 20 and Free_roll == 0 then
			Randomtradeoff()
		end
	else
		if differentType and #Dispensed > 0 and not bypassed and Multi == 1 then
			local type = BigList[ticket].item_type
			if CountInstances(Dispensed,type) > 0 and loop < 500 then
				goto reroll_loot
			end
		end
		local treasure = BigList[ticket].item_uuid
		TemplateAddTo(treasure,ID2,1,0)
		if BigList[ticket].item_rarity ~= "legendary" and Get("Pity") and not bypassed and l > 0 then
			Mods.REL_SE.PersistentVars.Misc.PityCount = Mods.REL_SE.PersistentVars.Misc.PityCount + 1
			print("[REL_SE] Pity Count: "..Mods.REL_SE.PersistentVars.Misc.PityCount)
		elseif Get("Pity") and not bypassed then
			Mods.REL_SE.PersistentVars.Misc.PityCount = 0
			print("[REL_SE] Legendary loot detected, pity count has been reset")
		end
		if (IsTradable(ID2) == 1 or CanTrade(ID2) == 1) and IsCharacter(ID2) then
			if not Mods.REL_SE.PersistentVars then
				Mods.REL_SE.PersistentVars = {}
				Mods.REL_SE.PersistentVars.Trader = {}
				Mods.REL_SE.PersistentVars.Trader.StatusRemoved = {}
				Mods.REL_SE.PersistentVars.Trader.Shuffled = {}
				Mods.REL_SE.PersistentVars.Trader.Generated = {}
				Mods.REL_SE.PersistentVars.Misc = {}
			end
			if not Mods.REL_SE.PersistentVars.Trader.Generated[ID2] then
				Mods.REL_SE.PersistentVars.Trader.Generated[ID2] = {}
			end
			table.insert(Mods.REL_SE.PersistentVars.Trader.Generated[ID2],treasure)
		end
		print("[REL_SE] Item distributed: "..BigList[ticket].item_name.." "..BigList[ticket].item_rarity.." "..BigList[ticket].item_type)
		if not Get("Duplicate") then	
			if differentType and #Dispensed < #Type_list - 1 then
				table.insert(Dispensed,Types[ticket])
			end
			table.insert(Looted_names, Names[ticket])
			table.insert(Looted_rarities, Rarities[ticket])
			table.insert(Looted_UUIDS, UUIDS[ticket])
			table.insert(Looted_types, Types[ticket])
			if not Act[ticket] then
				for i = 1,ticket do
					Act[i] = " "
				end
			end
			table.insert(Looted_acts,Act[ticket])
			table.remove(Act,ticket)
			table.remove(Names, ticket)
			table.remove(Rarities, ticket)
			table.remove(UUIDS, ticket)
			table.remove(Types, ticket)
			Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
			Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types,Looted_acts)
			table.insert(Mods.REL_SE.PersistentVars.Dropped,treasure)
		end
		Failed = 0
	end
	if IsContainer(ID2) == 1 or IsDead(ID2) == 1 or Osi.HasActiveStatus(ID2, "KNOCKED_OUT") == 1 then
		ApplyStatus(ID2, "LOOT_DISTRIBUTED_OBJECT",-1)
	elseif IsTradable(ID2) == 1 or CanTrade(ID2) == 1 then
		ApplyStatus(ID2, "LOOT_DISTRIBUTED_TRADER",-1)
	end
	-- Check if working
	print("[REL_SE] Name "..ResolveTranslatedString(GetDisplayName(ID2)))
	print("[REL_SE] Chance Array "..(u*100).." "..(r*100).." "..(v*100).." "..l*100)
	print("[REL_SE] Reward Threshold: Legendary:1-"..math.floor(l*Dicesize)..", Epic: "..math.floor(l*Dicesize+1).."-"..math.floor((v+l)*Dicesize)..
			", Rare:"..math.floor((v+l)*Dicesize+1).."-"..math.floor((v+r+l)*Dicesize)..", Uncommon:"..math.floor((v+r+l)*Dicesize+1).."-"..math.floor((v+r+u+l)*Dicesize))
end

function Generate_multiple_loot(ID2, typ, container_quality)
	if not Get("CosmeticVisible") then
		return
	end
	local time = 0
	print("Generate_multiple_loot using: typ:"..typ.."    container_quality: "..(container_quality or ""))
	local total_count = Get(typ .. "_MultiLootUnique")
	if total_count > 1 then
		Multi = 1
	elseif total_count <= 1 then
		Multi = 0
	end
	local ignore_fail = Get(typ .. "_IgnoreFail")
	local rate_mult = Get(typ .. "_UniquePenalty")
	local different_type = Get(typ .. "_DifferentType")
	local quality = (container_quality and container_quality > 0 and container_quality) or ""
	local multiplier = (container_quality == "B" and Get("B_UniqueRate")) or 1
	local u = Get(quality.."uncommon") * multiplier
	local r = Get(quality.."rare") * multiplier
	local v = Get(quality.."veryrare") * multiplier
	local l = Get(quality.."legendary") * multiplier
	while total_count > time do
		Generate_loot(ID2,u,r,v,l, false, different_type)
		if not ignore_fail and Failed == 1 then
			Dispensed = {}
			break
		end
		time = time + 1
		if Failed == 0 then
			u = u*(1-rate_mult/100)
			r = r*(1-rate_mult/100)
			v = v*(1-rate_mult/100)
			l = l*(1-rate_mult/100)
		end
	end
	Dispensed = {}
end

function Generate_multiple_cosmetic(ID2, typ, container_quality)
	local time = 0
	print("Generate_multiple_cosmetic using: typ:"..typ.."    container_quality: "..(container_quality or ""))
	local c_rate = nil
	if (container_quality and container_quality ~= '' and container_quality > 0) then
		c_rate = Get(container_quality.."Cosmetic")
	elseif typ == "" then
		c_rate=(Get("Cosmetic"))
	else
		c_rate=(Get("Cosmetic") * Get(typ .. "_CosmeticRate")/100)
	end
	if typ ~= "W"  then
		typ = "NW"
	end
	local total_count = Get(typ .. "_MultiLootUnique")
	local ignore_fail = Get(typ .. "_IgnoreFail")
	local rate_mult = Get(typ .. "_UniquePenalty")
	while total_count > time do
		Generate_cosmetic(ID2, c_rate)
		if not ignore_fail and Failed == 1 then
			break
		end
		time = time + 1
		if Failed == 0 then
			c_rate = c_rate*(1-rate_mult/100)
		end
	end
end

function Identify_type(ID)
	local number = GetEquipmentSlotForItem(ID)
	local Entity = Ext.Entity.Get(ID)
	if number == 11 then
		return "amulets"
	elseif number == 8 or number == 13 or number == 14 or number >= 17 then
		return "cosmetic"
	elseif number == 2 then
		return "cloaks"
	elseif number == 0 or number == 15 then
		return "hats"
	elseif number == 7 or number == 12 then
		return "rings"
	elseif number == 1 or number == 16 then
		if number == 1 then
			if Entity.Armor.ArmorClass > 0 then
				return "armor"
			else
				return "clothes"
			end
		end
		return "armor"
	elseif number == 9 then
		return "boots"
	elseif number == 10 then
		return "gloves"
	elseif number >= 3 and number <=6 then
		if number == 4 then
			if Entity.Armor and Entity.Armor.Shield ~= 0 then
				return "shields"
			end
		end
		return "weapons"
	end
end

function ShuffleTrader(ID, number)
	if not Get("TraderVisible") then
		return
	end
	if CountInstances(Mods.REL_SE.PersistentVars.Trader.Shuffled,ID) > 0 then
		print("[REL_SE] Already shuffled, exitting...")
		return
	end
	if not Mods.REL_SE.PersistentVars.Trader.Generated then
		Mods.REL_SE.PersistentVars.Trader.Generated = {}
	end
	if not Mods.REL_SE.PersistentVars.Trader.Generated[ID] then
		Mods.REL_SE.PersistentVars.Trader.Generated[ID] = {}
	end
	local pulled_list = GetUniqueGears(ID)
	local delete_list = {}
	local gear_list = {}
	for _, v in pairs(pulled_list) do
		local object = v.GameObjectVisual.RootTemplateId
		local rarity = v.Value.Rarity
		local name = v.Data.StatsId
		local actualname = ResolveTranslatedString(v.DisplayName.NameKey.Handle.Handle)
		local location = " "
		local itemtype = Identify_type(v.Uuid.EntityUuid)
		if rarity == 1 then
			rarity = "uncommon"
		elseif rarity == 2 then
			rarity = "rare"
		elseif rarity == 3 then
			rarity = "very rare"
		else
			rarity = "legendary"
		end
		if itemtype ~= "cosmetic" and (v.Value.Unique or Get("NonUniqueShuffle")) then
			table.insert(gear_list,{name = name, actualname = actualname, uuid = object,rarity = rarity, type = itemtype , location = location, guid = v.Uuid.EntityUuid})
		end
	end
	if Mods.REL_SE.PersistentVars.Trader.Generated and Mods.REL_SE.PersistentVars.Trader.Generated[ID] and 
	Mods.REL_SE.PersistentVars.Trader[ID] then
		if not Get("SoldShuffle") then
	-- remove record from gear_list that Generated list doesn't have to exclude sold items
			for i = #gear_list,1,-1 do
				if CountInstances(Mods.REL_SE.PersistentVars.Trader.Generated[ID],gear_list[i].uuid) == 0 then
					table.remove(gear_list,i)
				end
			end
		end
	-- remove record from Generated list that are not in gear_list (got bought)
		local gear_uuid_list = {}
		for _, v in pairs(gear_list) do
			table.insert(gear_uuid_list,v.uuid)
		end
		for i = #Mods.REL_SE.PersistentVars.Trader.Generated[ID],1,-1 do
			if CountInstances(gear_uuid_list,Mods.REL_SE.PersistentVars.Trader.Generated[ID][i]) == 0 then
				table.remove(Mods.REL_SE.PersistentVars.Trader.Generated[ID],i)
			end
		end
	end
	-- end record checking
	if not Mods.REL_SE.PersistentVars.Trader[ID] then
		Mods.REL_SE.PersistentVars.Trader[ID] = {}
		print("[REL_SE] Trader first time interaction, recorded original gear list")
		for _,v in pairs(gear_list) do
			table.insert(Mods.REL_SE.PersistentVars.Trader[ID],v)
			table.insert(Mods.REL_SE.PersistentVars.Trader.Generated[ID],v.uuid)
		end
		return
	elseif not Get("IncludeOrigins") then
		print("[REL_SE] Not 1st time interaction, removed original gear list from shuffling")
		for i = #gear_list,1,-1 do
			for _,a in pairs(Mods.REL_SE.PersistentVars.Trader[ID]) do
				if gear_list[i].uuid == a.uuid or gear_list[i].name == a.name then
					table.remove(gear_list,i)
					break
				end
			end
		end
	end
	for _,v in pairs(gear_list) do
		local Dicesize = math.floor(math.exp(Get("Dicesize") * math.log(10)))
		local Dice_roll = math.random(1,Dicesize)
		if Dice_roll <= number*Dicesize/100 then
			table.insert(delete_list,v)
		end
	end
	for _, v in pairs(delete_list) do
		if CountInstances(Mods.REL_SE.PersistentVars.Dropped,v.uuid) > 0 and
		TemplateIsInPartyInventory(v.uuid,GetHostCharacter(),0) == 0 and not Get("Duplicate") then
			local index = FindIndices(Looted_UUIDS,v.uuid)[1]
			table.remove(Looted_names,index)
			table.remove(Looted_rarities,index)
			table.remove(Looted_UUIDS,index)
			table.remove(Looted_types,index)
			table.remove(Looted_acts,index)
			local index2 = FindIndices(Mods.REL_SE.PersistentVars.Dropped,v.uuid)[1]
			table.remove(Mods.REL_SE.PersistentVars.Dropped,index2)
		end
		table.insert(Names, v.name)
		table.insert(Rarities, v.rarity)
		table.insert(UUIDS, v.uuid)
		table.insert(Types,v.type)
		table.insert(Act,v.location)
		print("[REL_SE]Added "..v.actualname.." to the pool")
	end
	Write_and_save(REL_Lootlist,Names,UUIDS, Rarities,Types, Act)
	for i = #delete_list,1,-1 do
		if Get("RandomizedShuffle") then
			local u, r, v, l = Rescaling(1,Get("uncommon"),Get("rare"),Get("veryrare"),Get("legendary"))
			Generate_loot(ID,u,r,v,l,true)
		else
			if delete_list[i].rarity == "uncommon" then
				Generate_loot(ID,10,0,0,0,true)
			elseif delete_list[i].rarity == "rare" then
				Generate_loot(ID,0,10,0,0,true)
			elseif delete_list[i].rarity == "very rare" then
				Generate_loot(ID,0,0,10,0,true)
			else
				Generate_loot(ID,0,0,0,10,true)
			end
		end
		RequestDelete(delete_list[i].guid)
		print("[REL_SE]Removed "..delete_list[i].actualname.." from trader")
	end
	table.insert(Mods.REL_SE.PersistentVars.Trader.Shuffled,ID)
end

function FindTwoHighestIndices(tbl)
    local max1, max2 = -math.huge, -math.huge
    local idx1, idx2
    for i, v in ipairs(tbl) do
        if v > max1 then
            max2 = max1
            max1 = v
            idx2 = idx1
            idx1 = i
        elseif v > max2 then
            max2 = v
            idx2 = i
        end
    end
    return idx1, idx2
end

function RandomEffect()
	local roll = math.random(1,100)
	print("[REL_SE] Rolled "..roll.." out of 100")
	if roll <= 50 - 9*Return_to_sender then
		if PartyGetGold(GetHostCharacter()) == 0 then
			if not Get("DisableMessageBoxes") then
				Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Bypassed_MSG)
			end
			Osi.ApplyStatus(GetHostCharacter(), "TWN_TOLLHOUSE_GOLDIFIED",-1)
		elseif PartyGetGold(GetHostCharacter()) < 200*math.max((9+Return_to_sender)/10,1) then
			if not Get("DisableMessageBoxes") then
				 Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Get_MSG)
			end
			Osi.PartyAddGold(GetHostCharacter(),-PartyGetGold(GetHostCharacter()))
		else
			if not Get("DisableMessageBoxes") then
				Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Get_MSG)
			end
			Osi.PartyAddGold(GetHostCharacter(),-200*math.max((9+Return_to_sender)/10,1))
		end
	elseif roll <= 55 - 8*Return_to_sender then
		if not Get("DisableMessageBoxes") then
			 Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"SLOW",-1)
	elseif roll <= 60 - 7*Return_to_sender then
		if not Get("DisableMessageBoxes") then
			 Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"LOW_STORMSHORETABERNACLE_GODCURSED", -1)
	elseif roll <= 66 - 6*Return_to_sender then
		if not Get("DisableMessageBoxes") then 
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"HAG_LOST_TIME",-1)
	elseif roll <= 72 - 5*Return_to_sender then
		local Stats = {GetAbility(GetHostCharacter(), "Strength"), 
					GetAbility(GetHostCharacter(), "Dexterity"), 
					GetAbility(GetHostCharacter(), "Constitution"), 
					GetAbility(GetHostCharacter(), "Intelligence"), 
					GetAbility(GetHostCharacter(), "Wisdom"), 
					GetAbility(GetHostCharacter(), "Charisma")}
		local comb_string = {"Strength", "Dexterity", "Constitution", "Intelligence", "Wisdom", "Charisma"}
		local s1, s2 = FindTwoHighestIndices(Stats)
		local T2 = {s1, s2}
		for m, n in pairs(T2) do
			for j, k in pairs(comb_string) do
				if n == j then
					T2[m] = k
				end
			end
		end
		if not Get("DisableMessageBoxes") then 
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),T2[1],-1)
		Osi.ApplyStatus(GetHostCharacter(),T2[2],-1)
	elseif roll <= 77 - 4*Return_to_sender then
		if not Get("DisableMessageBoxes") then
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		TimerLaunch("Repeated_haste"..GetHostCharacter(), 12000)
		Osi.ApplyStatus(GetHostCharacter(),"HASTE",2)
		CMND = GetHostCharacter()
	elseif roll <= 83 - 3*Return_to_sender then
		if not Get("DisableMessageBoxes") then
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"BANE",-1)
	elseif roll <= 89 - 2*Return_to_sender then
		if not Get("DisableMessageBoxes") then
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"SANCTUARY_BLOCK",-1)
	elseif roll <= 95 - Return_to_sender then
		if not Get("DisableMessageBoxes") then 
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"COMMAND_GROVEL", Return_to_sender*15,1,GetHostCharacter())
	else
		if not Get("DisableMessageBoxes") then 
			Osi.OpenMessageBox(GetHostCharacter(),Lunch_Money_Not_MSG)
		end
		Osi.ApplyStatus(GetHostCharacter(),"BANISHED", Return_to_sender*10,1, GetHostCharacter())
	end
end

function Randomtradeoff()
	local y1 = 1
	local y2 = 2
	local x1 = 0.05
	local x2 = 0.004
	local a = (y1-y2)/(x1-x2)
	local b = y1 - a*x1
	local x = (Get("rare")+Get("veryrare")+Get("legendary")+Get("uncommon"))/100
	local y = a*x + b
	local roll = math.random(1,100)
	if roll <= 50 - math.floor(7*y+0.25) then
		if PartyGetGold(GetHostCharacter()) <= 1000 then
			PartyAddGold(GetHostCharacter(), math.floor(500*y+0.25))
		elseif PartyGetGold(GetHostCharacter()) <= 2000 then
			PartyAddGold(GetHostCharacter(), math.floor(250*y+0.25))
		else
			PartyAddGold(GetHostCharacter(), math.floor(PartyGetGold(GetHostCharacter())*y*0.01+0.25))
		end
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(GetHostCharacter(), Gold_MSG)
		end
	elseif roll <= 57 - math.floor(6*y+0.25) then
		ApplyStatus(GetHostCharacter(),"HASTE", -1)
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(GetHostCharacter(),Go_fast_MSG)
		end
	elseif roll <= 65 - math.floor(5*y+0.25) then
		ApplyStatus(GetHostCharacter(), "GREATER_INVISIBILITY", -1)
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(GetHostCharacter(), Sneaky_MSG)
		end
		Blessed = GetHostCharacter()
		Sneaky_active = 1
		Sneaky_break_count = 0
		REL_ResetStatuses()
	elseif roll <= 72 - math.floor(4*y+0.25) then
		ApplyStatus(GetHostCharacter(), "BLESS", -1)
		ApplyStatus(GetHostCharacter(), "DIVINE_FAVOR", -1)
		ApplyStatus(GetHostCharacter(), "HEROISM", -1)
		ApplyStatus(GetHostCharacter(), "SHIELD_OF_FAITH", -1)
		ApplyStatus(GetHostCharacter(), "SANCTUARY", -1)
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(GetHostCharacter(), Supercharged_MSG)
		end
	elseif roll <= 79 - math.floor(3*y+0.25) then
		AddBoosts(GetHostCharacter(),"Ability(Charisma,"..math.floor(20*y+0.5)..",99)","",GetHostCharacter())
		Global_y = math.floor(20*y+0.25)
		Charismatic = GetHostCharacter()
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(Charismatic, Magical_jesus_MSG)
		end
		REL_ResetStatuses()
	elseif roll <= 86 - math.floor(2*y+0.25) then
		Second_life = math.floor(y+0.25)
		Blessed = GetHostCharacter()
		ApplyStatus(GetHostCharacter(),"DEATH_WARD",-1)
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(GetHostCharacter(),Second_life_MSG)
		end
		REL_ResetStatuses()
	elseif roll <= 93 - math.floor(y+0.25) then
		IOU = GetHostCharacter()
		if not Get("DisableMessageBoxes") then
			OpenMessageBox(GetHostCharacter(),IOU_MSG)
		end
		TimerLaunch(IOU, 10000)
		REL_ResetStatuses()
	else
		Free_roll = math.floor(3*y+0.25)
		if not Get("DisableMessageBoxes") then 
			OpenMessageBox(GetHostCharacter(), Status_Wiped_MSG)
		end
		REL_ResetStatuses()
	end
end

function GetPartyMemberGear()
	local output = {}
	local party = { Shart = nil, Asta = nil, Gale = nil, Lae = nil, Wyll = nil, Karl = nil,
					Mint = nil, Old = nil, Minsc = nil, Hals = nil, camp = nil}
	local ids = {"S_Player_ShadowHeart_3ed74f06-3c60-42dc-83f6-f034cb47c679",
				"S_Player_Astarion_c7c13742-bacd-460a-8f65-f864fe41f255",
				"S_Player_Gale_ad9af97d-75da-406a-ae13-7071c563f604",
				"S_Player_Laezel_58a69333-40bf-8358-1d17-fff240d7fb12",
				"S_Player_Wyll_c774d764-4a17-48dc-b470-32ace9ce447d",
				"S_Player_Karlach_2c76687d-93a2-477b-8b18-8a14b549304c",
				"S_GOB_DrowCommander_25721313-0c15-4935-8176-9f134385451b",
				"S_Player_Jaheira_91b6b200-7d00-4d62-8dc9-99e8339dfa1a",
				"S_Player_Minsc_0de603c5-42e2-4811-9dad-f652de080eba",
				"S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323"}
	table.insert(ids,Osi.DB_Camp_UserCampChest:Get(nil, nil)[1][2])
	for k, v in pairs(ids) do
		if Osi.IsPartyMember(v,1) == 1 then
			party[k] = GetUniqueGears(v) 
		end
	end
	for k, v in pairs(party) do
		if type(v) == "table" and #v > 0 then
			for _, y in pairs(v) do
				table.insert(output,y)
			end
		end
	end
	return output
end

function LoadedLootCheck() -- revert lootlist on save by checking with Oathbreaker Knight
	local UUIDS = ExtractStrings(REL_Lootlist, "%+%+(.-)%+%+")
	local Names = ExtractStrings(REL_Lootlist, "%-%-(.-)%-%-")
	local Rarities = ExtractStrings(REL_Lootlist,"<(.-)>")
	local Types = ExtractStrings(REL_Lootlist,"#(.-)#")
	local Act = ExtractStrings(REL_Lootlist,"!(.-)!")
	local Looted_acts = ExtractStrings(REL_ShadowRealm,"!(.-)!")
	local Looted_names = ExtractStrings(REL_ShadowRealm, "%-%-(.-)%-%-")
	local Looted_UUIDS = ExtractStrings(REL_ShadowRealm, "%+%+(.-)%+%+")
	local Looted_rarities = ExtractStrings(REL_ShadowRealm,"<(.-)>")
	local Looted_types = ExtractStrings(REL_ShadowRealm,"#(.-)#")
	local record = Osi.DB_Camp_UserCampChest:Get(nil, nil)
	local player_chestID = {}
	local companions = {"S_Player_Karlach_2c76687d-93a2-477b-8b18-8a14b549304c",
		"S_Player_Minsc_0de603c5-42e2-4811-9dad-f652de080eba",
		"S_GOB_DrowCommander_25721313-0c15-4935-8176-9f134385451b",
		"S_GLO_Halsin_7628bc0e-52b8-42a7-856a-13a6fd413323",
		"S_Player_Jaheira_91b6b200-7d00-4d62-8dc9-99e8339dfa1a",
		"S_Player_Gale_ad9af97d-75da-406a-ae13-7071c563f604",
		"S_Player_Astarion_c7c13742-bacd-460a-8f65-f864fe41f255",
		"S_Player_Laezel_58a69333-40bf-8358-1d17-fff240d7fb12",
		"S_Player_Wyll_c774d764-4a17-48dc-b470-32ace9ce447d",
		"S_Player_ShadowHeart_3ed74f06-3c60-42dc-83f6-f034cb47c679"}
	for _, v in pairs(record) do
		table.insert(player_chestID,v[2])
	end
	if Get("LagKiller") then
		if CountInstances(companions,GetHostCharacter()) == 0 then
			table.insert(companions,GetHostCharacter())
		end
		local all_containers = MergeUnique(companions,player_chestID)
		local all_gears = {}
		for _,v in pairs(all_containers) do
			local gears = GetUniqueGears(v)
			if #gears > 0 then
				for _, a in pairs(gears) do
					table.insert(all_gears,a.GameObjectVisual.RootTemplateId)
				end
			end
		end
		for _, v in pairs(all_gears) do
			local k = FindIndices(UUIDS,v)[1]
			if k then
				if CountInstances(Mods.REL_SE.PersistentVars.Dropped,UUIDS[k]) == 0 and not Get("Duplicate") then
					print("[REL_SE] Found "..Names[k].." already dispensed, moving record to Shadowrealm.txt")
					table.insert(Mods.REL_SE.PersistentVars.Dropped,UUIDS[k])
				end
				table.insert(Looted_names, Names[k]) 
				table.insert(Looted_rarities, Rarities[k])
				table.insert(Looted_UUIDS, UUIDS[k])
				table.insert(Looted_types, Types[k])
				if not Act[k] then
					for i = 1,k do
						Act[i] = " "
					end
				end
				table.insert(Looted_acts,Act[k])
				table.remove(Act,k)
				table.remove(Names, k)
				table.remove(Rarities, k)
				table.remove(UUIDS, k)
				table.remove(Types, k)
				if Get("EnableContinuum") then
					if TimerExists("Anomaly") == 0 then
						Osi.TimerLaunch("Anomaly",30000)
						Return_to_sender = Return_to_sender + 1
					end
				end
			end
		end
	else
		for k = #UUIDS, 1, -1 do
			local hasitem = false
			for _, v in pairs(player_chestID) do
				if TemplateIsInInventory(UUIDS[k],v) and TemplateIsInInventory(UUIDS[k],v) > 0 then
					hasitem = true
					break
				end
			end
			if not TemplateIsInPartyInventory(UUIDS[k],GetHostCharacter(),0) then
				print("[REL_SE] Invalid GUID for item "..Names[k].." with given GUID: "..UUIDS[k].." , record removed to avoid further bugs.")
				if Act[k] then
					table.remove(Act,k)
				end
				table.remove(Names, k)
				table.remove(Rarities, k)
				table.remove(UUIDS, k)
				table.remove(Types, k)
			elseif (CountInstances(Mods.REL_SE.PersistentVars.Dropped,UUIDS[k]) > 0 or
			((TemplateIsInPartyInventory(UUIDS[k],GetHostCharacter(),0) > 0 or hasitem) and 
			Types[k] ~= "potion" and Types[k] ~= "scroll" and Types[k] ~= "arrow" and Rarities[k] ~= "cosmetic" and 
			CountInstances(Mods.REL_SE.PersistentVars.Dropped,UUIDS[k]) == 0)) and not Get("Duplicate") then
				print("[REL_SE] Found "..Names[k].." already dispensed, moving record to Shadowrealm.txt")
				table.insert(Mods.REL_SE.PersistentVars.Dropped,UUIDS[k])
				table.insert(Looted_names, Names[k]) 
				table.insert(Looted_rarities, Rarities[k])
				table.insert(Looted_UUIDS, UUIDS[k])
				table.insert(Looted_types, Types[k])
				if not Act[k] then
					for i = 1,k do
						Act[i] = " "
					end
				end
				table.insert(Looted_acts,Act[k])
				table.remove(Act,k)
				table.remove(Names, k)
				table.remove(Rarities, k)
				table.remove(UUIDS, k)
				table.remove(Types, k)
				if Get("EnableContinuum") then
					if TimerExists("Anomaly") == 0 then
						Osi.TimerLaunch("Anomaly",30000)
						Return_to_sender = Return_to_sender + 1
					end
				end
			end
		end
	end
	if Looted_UUIDS then
		Return_to_sender = 0
		local all_containers = MergeUnique(companions,player_chestID)
		for k = #Looted_UUIDS, 1, -1 do
			local hasitem = false
			for _, v in pairs(all_containers) do
				if TemplateIsInInventory(Looted_UUIDS[k],v) and TemplateIsInInventory(Looted_UUIDS[k],v) > 0 then
					hasitem = true
					break
				end
			end
			if CountInstances(Mods.REL_SE.PersistentVars.Dropped,Looted_UUIDS[k]) == 0 and
			(TemplateIsInPartyInventory(Looted_UUIDS[k],GetHostCharacter(),0) == 0 and not hasitem) then
				print("[REL_SE] Found "..Looted_names[k].." not dispensed in current save, moving record back to Lootlist.txt")
				table.insert(Names, Looted_names[k])
				table.insert(Rarities, Looted_rarities[k])
				table.insert(UUIDS, Looted_UUIDS[k])
				table.insert(Types, Looted_types[k])
				if not Looted_acts[k] then
					for i = 1, k do
						Looted_acts[i] = " "
					end
				end
				table.insert(Act,Looted_acts[k])
				table.remove(Looted_acts,k)
				table.remove(Looted_names, k)
				table.remove(Looted_rarities, k)
				table.remove(Looted_UUIDS, k)
				table.remove(Looted_types, k)
				if Get("EnableContinuum") then
					if TimerExists("Anomaly") == 0 then
						Osi.TimerLaunch("Anomaly",60000)
					end
					Return_to_sender = Return_to_sender + 1
				end
			end
		end
	end
	Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
	Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
	_G.UUIDS = UUIDS
	_G.Names = Names
	_G.Rarities = Rarities
	_G.Types = Types
	_G.Act = Act
	_G.Looted_acts = Looted_acts
	_G.Looted_names = Looted_names
	_G.Looted_UUIDS = Looted_UUIDS
	_G.Looted_rarities = Looted_rarities
	_G.Looted_types = Looted_types
end
Type_list = {}
Rarity_list = {}
Count_list = {}
Type_rate_list = {}
Assorted_Type_list = {}

function Generate_weight_list()
	Type_list = UniqueValues(Types)
	for i = #Type_list, 1, -1 do
		if Type_list[i] == "scroll" or Type_list[i] == "potion" or Type_list[i] == "arrow" then
			table.remove(Type_list, i)
		end
	end
	Rarity_list = UniqueValues(Rarities)
	if #Rarity_list < 4 then
		print("[REL SE]Alert: You have at least 1 entirely missing rarity category. Check your LootList.txt in the Script Extender folder and inform either REL_SE or the generator author if you see this message. Ignore this message if your LootList.txt is indead missing at least 1 out of the following: uncommon, rare, very rare, legendary, cosmetic, or you are only using cosmetic items.")
	end
	table.sort(Type_list)
	table.sort(Rarity_list)
	Count_list = {CountInstances(Types, "amulets"), 
				CountInstances(Types, "armor"),
				CountInstances(Types, "boots"),
				CountInstances(Types, "cloaks"),
				CountInstances(Types, "clothes"),
				CountInstances(Types, "gloves"),
				CountInstances(Types, "hats"),
				CountInstances(Types, "invalid"),
				CountInstances(Types, "rings"),
				CountInstances(Types, "shields"),
				CountInstances(Types, "weapons")}
	Type_rate_list = {Get("amuletsrate"), Get("armorrate"), Get("bootsrate"), Get("cloaksrate"), Get("clothesrate"), Get("glovesrate"), Get("hatsrate"), Get("otherrate"), Get("ringsrate"), Get("shieldsrate"), Get("weaponsrate")}
	if #Type_rate_list < 10 then
		print("[REL SE] Alert: You have a missing type category. Check your LootList.txt in the Script Extender folder and inform either REL_SE or the generator author if you see this message. Ignore this message if you have looted at least 100 items from REL_SE.")
	end
	Assorted_Type_list = {}	
	for i = 1, #Type_list do
		if Count_list[i] ~= 0 then
			local k = 0
			local name = Type_list[i]
			if name == "amulets" then
				k = 1
			elseif name == "armor" then
				k = 2
			elseif name == "boots" then
				k = 3
			elseif name == "cloaks" then
				k = 4
			elseif name == "clothes" then
				k = 5
			elseif name == "gloves" then
				k = 6
			elseif name == "hats" then
				k = 7
			elseif name == "invalid" then
				k = 8
			elseif name == "rings" then
				k = 9
			elseif name == "shields" then
				k = 10
			elseif name == "weapons" then
				k = 11
			end
			table.insert(Assorted_Type_list, {
				type_name = Type_list[i],
				type_rate = Type_rate_list[k],
				type_count = Count_list[k]
			})
		end
	end
	table.sort(Assorted_Type_list, CompareRate)
end


Ext.Osiris.RegisterListener("RequestTrade", 4, "before", function(_, ID2, _, _)
	local name = ResolveTranslatedString(Ext.Entity.Get(ID2).DisplayName.NameKey.Handle.Handle)
	local BlackList = Get("BlackList")
	if type(BlackList) == "string" then
		Mods.BG3MCM.MCMAPI:ResetSettingValue("BlackList", ModuleUUID)
		BlackList = Get("BlackList")
	end
	if CanTrade(ID2) == 1 and CountInstances(BlackList,name) == 0 then 
		if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_TRADER") == 1 then
			if #Mods.REL_SE.PersistentVars.Trader.StatusRemoved >0 and CountInstances(Mods.REL_SE.PersistentVars.Trader.StatusRemoved,ID2) > 0 then
				print("[REL_SE] Trader already rolled this long rest")
			else
				RemoveStatus(ID2,"LOOT_DISTRIBUTED_TRADER")
				print("[REL_SE]Removed status from "..ResolveTranslatedString(GetDisplayName(ID2)))
				table.insert(Mods.REL_SE.PersistentVars.Trader.StatusRemoved,ID2)
			end
		end
		if Mods.REL_SE.PersistentVars.Misc.Shuffle and Get("RealEconomy") then
			ShuffleTrader(ID2,Mods.REL_SE.PersistentVars.Misc.Shuffle)
		end
		if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_TRADER") == 0 then
			--for items integrated into REL but treasure table isn't overwritten
			local item_list, chest_list = GetUniqueGears(ID2,"Camp")
			for _, v in pairs(chest_list) do
				for _, k in pairs(item_list) do
					local object = k.GameObjectVisual.RootTemplateId
					if (TemplateIsInInventory(object,v) == 1 or
					TemplateIsInPartyInventory(object,GetHostCharacter(),0) == 1) and
					CountInstances(UUIDS,object) > 0 then
						local index = FindIndices(UUIDS,object)[1]
						if Rarities[index] ~= "cosmetic" then
							table.insert(Looted_names, Names[index])
							table.insert(Looted_rarities, Rarities[index])
							table.insert(Looted_UUIDS, UUIDS[index])
							table.insert(Looted_types, Types[index])
							if not Act[index] then
								for i = 1,index do
									Act[i] = " "
								end
							end
							table.insert(Looted_acts,Act[index])
							table.remove(Act,index)
							table.remove(Names, index)
							table.remove(Rarities, index)
							table.remove(UUIDS, index)
							table.remove(Types,index)
						end
					end
				end
			end
			-- end record checking
			Generate_multiple_cosmetic(ID2, "T")
			Generate_multiple_loot(ID2, "T")
			Generate_stuff(ID2, "scroll", "T")
			Generate_stuff(ID2, "potion", "T")
			Generate_stuff(ID2, "arrow", "T")
			table.insert(Mods.REL_SE.PersistentVars.Trader.StatusRemoved,ID2)
		end
	end
end)

Ext.Osiris.RegisterListener("CharacterLootedCharacter", 2, "before", function(_, ID2)
	local name = ResolveTranslatedString(Ext.Entity.Get(ID2).DisplayName.NameKey.Handle.Handle)
	local BlackList = Get("BlackList")
	if type(BlackList) == "string" then
		Mods.BG3MCM.MCMAPI:ResetSettingValue("BlackList", ModuleUUID)
		BlackList = Get("BlackList")
	end
	local item_list, chest_list = GetUniqueGears(ID2,"Camp")
	local exist = {}
	for _, v in pairs(chest_list) do
		for _, k in pairs(item_list) do
			local object = k.GameObjectVisual.RootTemplateId
			if (not TemplateIsInInventory(object,v)) or 
			(TemplateIsInPartyInventory(object,v,0) and TemplateIsInPartyInventory(object,v,0) == 0 and CountInstances(exist,object) == 0) then
				table.insert(exist,object)
			end
		end
	end
	if Get("ClearLooted") and not Get("Duplicate") then
		local count = 0
		local curr_obj = nil
		table.sort(item_list, Alphabetical_Visual)
		for _, v in pairs(item_list) do
			local object = v.GameObjectVisual.RootTemplateId
			local entity = v.Uuid.EntityUuid
			local item_name = ResolveTranslatedString(GetDisplayName(entity))
			if not curr_obj or curr_obj ~= object then
				curr_obj = object
				count = 0
			end
			if (CountInstances(Mods.REL_SE.PersistentVars.Dropped,object) > 0 or
			(TemplateIsInPartyInventory(object,GetHostCharacter(),0) and TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 1) or 
			CountInstances(exist,object) > 0) and count >= 0 then
				if (TemplateIsInPartyInventory(object,GetHostCharacter(),0) and TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0) or
					 CountInstances(exist,object) > 0 then
					if TemplateIsInPartyInventory(object,GetHostCharacter(),0) and CountInstances(exist,object) and
					(TemplateIsInPartyInventory(object,GetHostCharacter(),0) + CountInstances(exist,object) == 0) then
						count = -2
					end
					if  TemplateIsInPartyInventory(object,GetHostCharacter(),0) and CountInstances(exist,object) and 
					TemplateIsInPartyInventory(object,GetHostCharacter(),0) + CountInstances(exist,object) > count + 1 then
						if GetStackAmount(entity) > 1 then
							SetStackAmount(entity,1)
							print("[REL_SE] Reduced stack of "..item_name.." to 1")
						else
							count = count + 1
							RequestDelete(entity)
							print("[REL_SE] Deleted 1 duplicate of "..item_name)
						end
						if Get("Compensate") then
							local rarity = v.Value.Rarity
							if rarity == 4 then
								Generate_loot(ID2,0,0,0,10,true)
							elseif rarity == 3 then
								Generate_loot(ID2,0,0,10,0,true)
							elseif rarity == 2 then
								Generate_loot(ID2,0,10,0,0,true)
							else
								Generate_loot(ID2,10,0,0,0,true)
							end
						end
					end
				end
			end
		end
	end
	if not Get("BossVisible") and ((IsBoss(ID2) == 1 or string.find(ResolveTranslatedString(GetDisplayName(ID2)),"Gortash") ) and 
		(IsAlly(GetHostCharacter(),ID2) == 0 or IsEnemy(GetHostCharacter(),ID2) == 1) and
		IsPartyMember(ID2,1) == 0 and CountInstances(BlackList,name) == 0) then
		if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 then
			for _, v in pairs(chest_list) do
				for _, k in pairs(item_list) do
					local object = k.GameObjectVisual.RootTemplateId
					if TemplateIsInInventory(object,v) > 0 and CountInstances(exist,object) == 0 then
						table.insert(exist,object)
					end
				end
			end
			for _, k in pairs(item_list) do
				local object = k.GameObjectVisual.RootTemplateId
				if (CountInstances(exist,object) > 0 or TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0 )and
				CountInstances(UUIDS,object) > 0 then
					local index = FindIndices(UUIDS,object)[1]
					if Rarities[index] ~= "cosmetic" then
						table.insert(Looted_names, Names[index])
						table.insert(Looted_rarities, Rarities[index])
						table.insert(Looted_UUIDS, UUIDS[index])
						table.insert(Looted_types, Types[index])
						if not Act[index] then
							for i = 1,index do
								Act[i] = " "
							end
						end
						table.insert(Looted_acts,Act[index])
						table.remove(Act,index)
						table.remove(Names, index)
						table.remove(Rarities, index)
						table.remove(UUIDS, index)
						table.remove(Types,index)
					end
				end
			end
			Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
			Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
			Generate_multiple_cosmetic(ID2, "B")
			Generate_multiple_loot(ID2, "B")
			Generate_stuff(ID2, "scroll", "B")
			Generate_stuff(ID2, "potion", "B")
			Generate_stuff(ID2, "arrow", "B")
		end
		if Get("EnableContinuum") and Return_to_sender > 0 then
			if Osi.TimerExists("Anomaly") == 1 then
				RandomEffect()
				Osi.TimerCancel("Anomaly")
			end
		end
	elseif not Get("MobVisible") and ((IsBoss(ID2) == 0 and not string.find(ResolveTranslatedString(GetDisplayName(ID2)),"Gortash")) 
	and ((IsAlly(GetHostCharacter(),ID2) == 0 and IsPartyMember(ID2,1) == 0 and IsEnemy(GetHostCharacter(),ID2) == 1) or 
	(Get("IncludeNeutral") and IsPartyMember(ID2,1) == 0 and IsAlly(GetHostCharacter(),ID2) == 0 and IsEnemy(GetHostCharacter(),ID2) == 0) or
	(Get("IncludeAlly") and IsPartyMember(ID2,1) == 0 and IsAlly(GetHostCharacter(),ID2) == 1 and IsEnemy(GetHostCharacter(),ID2) == 0)) and IsDead(ID2) == 1) then
		if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 then
			for _, v in pairs(chest_list) do
				for _, k in pairs(item_list) do
					local object = k.GameObjectVisual.RootTemplateId
					if TemplateIsInInventory(object,v) > 0 and CountInstances(exist,object) == 0 then
						table.insert(exist,object)
					end
				end
			end
			for _, k in pairs(item_list) do
				local object = k.GameObjectVisual.RootTemplateId
				if (CountInstances(exist,object) > 0 or TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0 )and
				CountInstances(UUIDS,object) > 0 then
					local index = FindIndices(UUIDS,object)[1]
					if Rarities[index] ~= "cosmetic" then
						table.insert(Looted_names, Names[index])
						table.insert(Looted_rarities, Rarities[index])
						table.insert(Looted_UUIDS, UUIDS[index])
						table.insert(Looted_types, Types[index])
						if not Act[index] then
							for i = 1,index do
								Act[i] = " "
							end
						end
						table.insert(Looted_acts,Act[index])
						table.remove(Act,index)
						table.remove(Names, index)
						table.remove(Rarities, index)
						table.remove(UUIDS, index)
						table.remove(Types,index)
					end
				end
			end
			Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
			Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
			Generate_multiple_cosmetic(ID2, "M")
			Generate_multiple_loot(ID2, "M")
			Generate_stuff(ID2, "scroll", "M")
			Generate_stuff(ID2, "potion", "M")
			Generate_stuff(ID2, "arrow", "M")
		end
		if Get("EnableContinuum") and Return_to_sender > 0 then
			if Osi.TimerExists("Anomaly") == 1 then
				RandomEffect()
				Osi.TimerCancel("Anomaly")
			end
		end
	end
end)

Ext.Osiris.RegisterListener("TimerFinished",1,"after",function(guid) 
	if Get("EnableContinuum") then
		if string.find(guid,"Repeated_haste") then
			TimerLaunch("Repeated_haste"..CMND, 15000)
			Osi.ApplyStatus(CMND,"HASTE",2)
			Haste_count = math.max(Haste_count,1) + 1
			if Haste_count > 5+Return_to_sender*5 then
				Osi.TimerCancel("Repeated_haste"..CMND)
				Haste_count = 0
			end
			REL_ResetStatuses()
		end
		if guid == Victim then
			if PartyGetGold(GetHostCharacter()) >= 200 then
				RemoveStatus(guid,"TWN_TOLLHOUSE_GOLDIFIED")
				Osi.PartyAddGold(GetHostCharacter(),-200)
				if not Get("DisableMessageBoxes") then
					Osi.OpenMessageBox(guid, Flesh_to_Gold_Reverted_MSG)
				end
				Victim = 0
				REL_ResetStatuses()
			else
				TimerLaunch(guid, 5000)
			end
		end
	end
	if Get("EnableInsurance") then
		if guid == IOU and IsInCombat(IOU) == 1 and UserGetGold(IOU) == 13 then
			AddBoosts(guid,"Resistance(Necrotic,Immune)","","")
			TimerLaunch("Second_Coming", 10000 )
			if not Get("DisableMessageBoxes") then 
				OpenMessageBox(IOU, "You hear something ticking, down, down..")
			end
			REL_ResetStatuses()
		elseif guid == IOU and UserGetGold(IOU) == 13 then
			AddBoosts(guid,"Resistance(Necrotic,Immune)","","")
			UseSpell(IOU, "Target_CircleOfDeath", IOU)
			TimerLaunch("Immortality_Ends", 3000)
		elseif guid == IOU then
			TimerLaunch(IOU,10000)
		end
		if guid == "Second_Coming" then
			UseSpell(IOU, "Target_CircleOfDeath", IOU)
			TimerLaunch("Third Coming", 10000)
		end
		if guid == "Third Coming" then
			UseSpell(IOU, "Shout_DestructiveWave_Radiant", IOU)
			TimerLaunch("Immortality_Ends", 3000)
		end
		if guid == "Immortality_Ends" then
			RemoveBoosts(IOU,"Resistance(Necrotic,Immune)",1,"","")
			IOU = 0
			REL_ResetStatuses()
		end
	end
end)

Ext.Osiris.RegisterListener("TurnEnded", 1, "after", function(guid)
	if Get("EnableInsurance") then
		if IOU == guid and IsInCombat(guid) == 1 and TimerExists("Second_Coming") == 1 then
			TimerPause("Second_Coming")
		end
		if IOU == guid and IsInCombat(guid) == 1 and TimerExists("Third Coming") == 1 then
			TimerPause("Third Coming")
		end
	end
	end)

Ext.Osiris.RegisterListener("TurnStarted", 1, "after", function(guid)
	if Get("EnableInsurance") then
		if IOU == guid and IsInCombat(guid) == 1 and TimerExists("Second_Coming") == 1 then
			TimerUnpause("Second_Coming")
		end
		if IOU == guid and IsInCombat(guid) == 1 and TimerExists("Third Coming") == 1 then
			TimerUnpause("Third Coming")
		end
	end
	end)

Ext.Osiris.RegisterListener("LongRestFinished",0,"after",function()
	Mods.REL_SE.PersistentVars.Trader.StatusRemoved = {}
	if Get("LongRestRate") > 0 and Get("RealEconomy") then
		Mods.REL_SE.PersistentVars.Misc.Shuffle = Get("LongRestRate")
		Mods.REL_SE.PersistentVars.Trader.Shuffled = {}
	end
	if Get("EnableInsurance") and Charismatic and #Charismatic > 10 and GetAbility(Charismatic,"Charisma") >= 38 then
		RemoveBoosts(Charismatic,"Ability(Charisma,"..Global_y..",70)",1,"",Charismatic)
		Charismatic = 0
	end
	Victim = 0
	Sneaky_active = 0
	Sneaky_break_count = 0
	Second_life = 0
	IOU = 0
	Free_roll = 0
	REL_ResetStatuses()
end)

Ext.Osiris.RegisterListener("StatusApplied",4,"after",function(guid, status_name, _, _)
	if Get("EnableContinuum") and status_name == "TWN_TOLLHOUSE_GOLDIFIED" then
		TimerLaunch(guid, 5000)
		Victim = guid
	end
	if Get("LootInjectionAuto") and status_name == "U_AutolootAuraAura"
		and HasActiveStatus(guid, "LOOT_DISTRIBUTED_OBJECT") == 0 and ((IsCharacter(guid) == 1 and IsDead(guid) == 1) or IsContainer(guid) == 1) then
		local name = ResolveTranslatedString(Ext.Entity.Get(guid).DisplayName.NameKey.Handle.Handle)
		local BlackList = Get("BlackList")
		if type(BlackList) == "string" then
			Mods.BG3MCM.MCMAPI:ResetSettingValue("BlackList", ModuleUUID)
			BlackList = Get("BlackList")
		end
		if Get("REL_Override") then
			if GetUniqueGears(guid)[1] then
				ApplyStatus(guid,"LOOT_DISTRIBUTED_OBJECT",-1)
				print("[REL_SE] REL unique loot detected, container ignored")
				goto fail1
			end
		end
		local item_list, chest_list = GetUniqueGears(guid,"Camp")
		local exist = {}
		for _, v in pairs(chest_list) do
			for _, k in pairs(item_list) do
				local object = k.GameObjectVisual.RootTemplateId
				if TemplateIsInInventory(object,v) and TemplateIsInInventory(object,v) > 0 and CountInstances(exist,object) == 0 then
					table.insert(exist,object)
				end
			end
		end
		for _, k in pairs(item_list) do
			local object = k.GameObjectVisual.RootTemplateId
			if TemplateIsInPartyInventory(object,GetHostCharacter(),0) and (CountInstances(exist,object) > 0 or TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0) and
			CountInstances(UUIDS,object) > 0 then
				local index = FindIndices(UUIDS,object)[1]
				if Rarities[index] ~= "cosmetic" then
					table.insert(Looted_names, Names[index])
					table.insert(Looted_rarities, Rarities[index])
					table.insert(Looted_UUIDS, UUIDS[index])
					table.insert(Looted_types, Types[index])
					if not Act[index] then
						for i = 1,index do
							Act[i] = " "
						end
					end
					table.insert(Looted_acts,Act[index])
					table.remove(Act,index)
					table.remove(Names, index)
					table.remove(Rarities, index)
					table.remove(UUIDS, index)
					table.remove(Types,index)
				end
			end
		end
		Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
		Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
		if Get("ClearLooted") and not Get("Duplicate") then
			local count = 0
			local curr_obj = nil
			table.sort(item_list, Alphabetical_Visual)
			for _, v in pairs(item_list) do
				local object = v.GameObjectVisual.RootTemplateId
				local entity = v.Uuid.EntityUuid
				local item_name = ResolveTranslatedString(GetDisplayName(entity))
				if not curr_obj or curr_obj ~= object then
					curr_obj = object
					count = 0
				end
				if (CountInstances(Mods.REL_SE.PersistentVars.Dropped,object) > 0 or
				(TemplateIsInPartyInventory(object,GetHostCharacter(),0) and TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 1) or 
				CountInstances(exist,object) > 0) and count >= 0 then
					if (TemplateIsInPartyInventory(object,GetHostCharacter(),0) and TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0) or
						 CountInstances(exist,object) > 0 then
						if TemplateIsInPartyInventory(object,GetHostCharacter(),0) and CountInstances(exist,object) and
						(TemplateIsInPartyInventory(object,GetHostCharacter(),0) + CountInstances(exist,object) == 0) then
							count = -2
						end
						if  TemplateIsInPartyInventory(object,GetHostCharacter(),0) and CountInstances(exist,object) and 
						TemplateIsInPartyInventory(object,GetHostCharacter(),0) + CountInstances(exist,object) > count + 1 then
							if GetStackAmount(entity) > 1 then
								SetStackAmount(entity,1)
								print("[REL_SE] Reduced stack of "..item_name.." to 1")
							else
								count = count + 1
								RequestDelete(entity)
								print("[REL_SE] Deleted 1 duplicate of "..item_name)
							end
							if Get("Compensate") then
								local rarity = v.Value.Rarity
								if rarity == 4 then
									Generate_loot(ID2,0,0,0,10,true)
								elseif rarity == 3 then
									Generate_loot(ID2,0,0,10,0,true)
								elseif rarity == 2 then
									Generate_loot(ID2,0,10,0,0,true)
								else
									Generate_loot(ID2,10,0,0,0,true)
								end
							end
						end
					end
				end
			end
		end
		if CountInstances(BlackList,name) > 0 then
			goto fail1
		end
		if GetCategory(Container,GetDisplayName(guid),true) == "Chest" or
		(string.find(guid,"Chest") or string.find(guid,"chest") ) then
			local container_quality = 0
			if Get("enableChestSpecific") then
				container_quality = GetCategory(Container, GetDisplayName(guid),false)
				if container_quality ~= 1 and container_quality ~= 2 and container_quality ~= 3 then
					goto fail1
				end
			end
			Generate_multiple_cosmetic(guid, "C", container_quality)
			Generate_multiple_loot(guid, "C", container_quality)
			Generate_stuff(guid, "scroll", "C")
			Generate_stuff(guid, "potion", "C")
			Generate_stuff(guid, "arrow", "C")
			if Get("EnableContinuum") and Return_to_sender > 0 then
				if Osi.TimerExists("Anomaly") == 1 and Osi.TimerExists("SaveLoaded") == 1 then
					RandomEffect()
					Osi.TimerCancel("Anomaly")
				end
			end
		elseif GetCategory(Container, GetDisplayName(guid), true) == "Wardrobe" and
		#FindIndices(Rarities, "cosmetic") > 0 then
			local container_quality = GetCategory(Container, GetDisplayName(guid), false)
			Generate_multiple_cosmetic(guid, "W", container_quality)
		elseif GetCategory(Container,GetDisplayName(guid),true) == "Bottle" then
			Generate_stuff(guid, "potion", "C")
		elseif GetCategory(Container,GetDisplayName(guid), true) =="Scroll" then
			Generate_stuff(guid, "scroll", "C")
		elseif GetCategory(Container,GetDisplayName(guid),true) == "Arrow" then
			Generate_stuff(guid, "arrow", "C")
		elseif (IsBoss(guid) == 1 or string.find(ResolveTranslatedString(GetDisplayName(guid)),"Gortash") ) 
				and (IsAlly(GetHostCharacter(),guid) == 0 or IsPartyMember(guid,1) == 0) and IsDead(guid) == 1  then
			Generate_multiple_cosmetic(guid, "B")
			Generate_multiple_loot(guid,"B")
			Generate_stuff(guid, "scroll", "B")
			Generate_stuff(guid, "potion", "B")
			Generate_stuff(guid, "arrow", "B")
			if Get("EnableContinuum") and Return_to_sender > 0 then
				if Osi.TimerExists("Anomaly") == 1 and Osi.TimerExists("SaveLoaded") == 1 then
					RandomEffect()
					Osi.TimerCancel("Anomaly")
				end
			end
		elseif (IsBoss(guid) == 0 and not string.find(ResolveTranslatedString(GetDisplayName(guid)),"Gortash")) 
		and ((IsAlly(GetHostCharacter(),guid) == 0 and IsPartyMember(guid,1) == 0 and IsEnemy(GetHostCharacter(),guid) == 1) or 
		(Get("IncludeNeutral") and IsPartyMember(guid,1) == 0 and IsAlly(GetHostCharacter(),guid) == 0 and IsEnemy(GetHostCharacter(),guid) == 0) or
		(Get("IncludeAlly") and IsPartyMember(guid,1) == 0 and IsAlly(GetHostCharacter(),guid) == 1 and IsEnemy(GetHostCharacter(),guid) == 0)) and IsDead(guid) == 1 then
			Generate_multiple_cosmetic(guid, "M")
			Generate_multiple_loot(guid,"M")
			Generate_stuff(guid, "scroll", "M")
			Generate_stuff(guid, "potion", "M")
			Generate_stuff(guid, "arrow", "M")
			if Get("EnableContinuum") and Return_to_sender > 0 then
				if Osi.TimerExists("Anomaly") == 1 and Osi.TimerExists("SaveLoaded") == 1 then
					RandomEffect()
					Osi.TimerCancel("Anomaly")
				end
			end
		elseif Get("AnyContainer") ~= "" and (IsContainer(guid) == 1 or (IsCharacter(guid) == 1 and IsDead(guid) == 1)) then
			Generate_multiple_cosmetic(guid, GetAnyContainerType(), GetAnyContainerQuality())
			Generate_multiple_loot(guid, GetAnyContainerType(), GetAnyContainerQuality())
			Generate_stuff(guid, "scroll", GetAnyContainerType())
			Generate_stuff(guid, "potion", GetAnyContainerType())
			Generate_stuff(guid, "arrow", GetAnyContainerType())
		end
		::fail1::
	end
end)

Ext.Osiris.RegisterListener("StatusRemoved",4,"before",function(guid, string, _, _)
	if Get("EnableInsurance") then
		if string == "GREATER_INVISIBILITY" and Sneaky_active == 1 and Sneaky_break_count <2 then
			ApplyStatus(guid, "GREATER_INVISIBILITY", -1)
			Sneaky_break_count = Sneaky_break_count + 1
			REL_ResetStatuses()
		end
		if string == "DEATH_WARD" and string.find(guid, Blessed:gsub("-","%%-")) and #Blessed > 10 and Second_life >0 then
			SetHitpoints(guid,GetMaxHitpoints(guid))
			if GetMaxHitpoints(guid) <= 100 then
				AddBoosts(guid, "TemporaryHP("..100-GetMaxHitpoints(guid)..")","","")
			end
			Second_life = 0
			Blessed = 0
			REL_ResetStatuses()
		end
	end
end)

Ext.Osiris.RegisterListener("UseStarted", 2, "before", function(_, ID2)
	if IsContainer(ID2) == 1 then
		local name = ResolveTranslatedString(Ext.Entity.Get(ID2).DisplayName.NameKey.Handle.Handle)
		local BlackList = Get("BlackList")
		if type(BlackList) == "string" then
			Mods.BG3MCM.MCMAPI:ResetSettingValue("BlackList", ModuleUUID)
			BlackList = Get("BlackList")
		end
		if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and Get("REL_Override") then
			if GetUniqueGears(ID2)[1] then
				ApplyStatus(ID2,"LOOT_DISTRIBUTED_OBJECT",-1)
				print("[REL_SE] Unique loot detected, container ignored")
				goto fail
			end
		end
		do
			local item_list, chest_list = GetUniqueGears(ID2,"Camp")
			local exist = {}
			for _, v in pairs(chest_list) do
				for _, k in pairs(item_list) do
					local object = k.GameObjectVisual.RootTemplateId
					if (not TemplateIsInInventory(object,v)) or 
					(TemplateIsInPartyInventory(object,v,0) and TemplateIsInPartyInventory(object,v,0) == 0 and CountInstances(exist,object) == 0) then
						table.insert(exist,object)
					end
				end
			end
			if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 then
				for _, k in pairs(item_list) do
					local object = k.GameObjectVisual.RootTemplateId
					if (CountInstances(exist,object) > 0 or TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0) and
					CountInstances(UUIDS,object) > 0 then
						local index = FindIndices(UUIDS,object)[1]
						if Rarities[index] ~= "cosmetic" then
							table.insert(Looted_names, Names[index])
							table.insert(Looted_rarities, Rarities[index])
							table.insert(Looted_UUIDS, UUIDS[index])
							table.insert(Looted_types, Types[index])
							if not Act[index] then
								for i = 1,index do
									Act[i] = " "
								end
							end
							table.insert(Looted_acts,Act[index])
							table.remove(Act,index)
							table.remove(Names, index)
							table.remove(Rarities, index)
							table.remove(UUIDS, index)
							table.remove(Types,index)
						end
					end
				end
				Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
				Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
			end
			if Get("ClearLooted") and not Get("Duplicate") then
				local count = 0
				local curr_obj = nil
				table.sort(item_list, Alphabetical_Visual)
				for _, v in pairs(item_list) do
					local object = v.GameObjectVisual.RootTemplateId
					local entity = v.Uuid.EntityUuid
					local item_name = ResolveTranslatedString(GetDisplayName(entity))
					if not curr_obj or curr_obj ~= object then
						curr_obj = object
						count = 0
					end
					if (CountInstances(Mods.REL_SE.PersistentVars.Dropped,object) > 0 or
					(TemplateIsInPartyInventory(object,GetHostCharacter(),0) and TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 1) or 
					CountInstances(exist,object) > 0) and count >= 0 then
						if (TemplateIsInPartyInventory(object,GetHostCharacter(),0) and TemplateIsInPartyInventory(object,GetHostCharacter(),0) > 0) or
							 CountInstances(exist,object) > 0 then
							if TemplateIsInPartyInventory(object,GetHostCharacter(),0) and CountInstances(exist,object) and
							(TemplateIsInPartyInventory(object,GetHostCharacter(),0) + CountInstances(exist,object) == 0) then
								count = -2
							end
							if  TemplateIsInPartyInventory(object,GetHostCharacter(),0) and CountInstances(exist,object) and 
							TemplateIsInPartyInventory(object,GetHostCharacter(),0) + CountInstances(exist,object) > count + 1 then
								if GetStackAmount(entity) > 1 then
									SetStackAmount(entity,1)
									print("[REL_SE] Reduced stack of "..item_name.." to 1")
								else
									count = count + 1
									RequestDelete(entity)
									print("[REL_SE] Deleted 1 duplicate of "..item_name)
								end
								if Get("Compensate") then
									local rarity = v.Value.Rarity
									if rarity == 4 then
										Generate_loot(ID2,0,0,0,10,true)
									elseif rarity == 3 then
										Generate_loot(ID2,0,0,10,0,true)
									elseif rarity == 2 then
										Generate_loot(ID2,0,10,0,0,true)
									else
										Generate_loot(ID2,10,0,0,0,true)
									end
								end
							end
						end
					end
				end
			end
		end
		if CountInstances(BlackList,name) > 0 then
			print("blacklisted: "..name)
			goto fail
		end
		if HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and (GetCategory(Container,GetDisplayName(ID2),true) == "Chest" or
		(string.find(ID2,"Chest") or string.find(ID2,"chest"))) then
			local container_quality = 0
			if Get("enableChestSpecific") then
				container_quality = GetCategory(Container, GetDisplayName(ID2),false)
				if container_quality ~= 1 and container_quality ~= 2 and container_quality ~= 3 then
					goto fail
				end
			end
			Generate_multiple_cosmetic(ID2, "C", container_quality)
			Generate_multiple_loot(ID2,"C", container_quality)
			Generate_stuff(ID2, "scroll", "C")
			Generate_stuff(ID2, "potion", "C")
			Generate_stuff(ID2, "arrow", "C")
			if Get("EnableContinuum") and Return_to_sender > 0 then
				if Osi.TimerExists("Anomaly") == 1 and Osi.TimerExists("SaveLoaded") == 1 then
					RandomEffect()
					Osi.TimerCancel("Anomaly")
				end
			end
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and GetCategory(Container,GetDisplayName(ID2),true) == "Wardrobe" and
		#FindIndices(Rarities, "cosmetic") > 0 then
			local container_quality = GetCategory(Container, GetDisplayName(ID2),false)
			Generate_multiple_cosmetic(ID2, "W", container_quality)
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and GetCategory(Container,GetDisplayName(ID2),true) =="Bottle" then
			Generate_stuff(ID2, "potion", "C")
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and GetCategory(Container,GetDisplayName(ID2),true) == "Scroll" then
			Generate_stuff(ID2, "scroll", "C")
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and GetCategory(Container,GetDisplayName(ID2),true) == "Arrow" then
			Generate_stuff(ID2, "arrow", "C")
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 0 and Get("AnyContainer") ~= "" then
			Generate_multiple_cosmetic(ID2, GetAnyContainerType(), GetAnyContainerQuality())
			Generate_multiple_loot(ID2, GetAnyContainerType(), GetAnyContainerQuality())
			Generate_stuff(ID2, "scroll", GetAnyContainerType())
			Generate_stuff(ID2, "potion", GetAnyContainerType())
			Generate_stuff(ID2, "arrow", GetAnyContainerType())
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 1 and Free_roll > 0 and Get("EnableInsurance") then
			local container_quality = 0
			local Uncommon_rate = Get("uncommon")
			local Rare_rate = Get("rare")
			local Very_rare_rate = Get("veryrare")
			local Legendary_rate = Get("legendary")
			if Get("enableChestSpecific") then
				container_quality = GetCategory(Container, GetDisplayName(ID2),false)
				if container_quality ~= 1 and container_quality ~= 2 and container_quality ~= 3 then
					goto fail
				end
			end
			if (Uncommon_rate+Rare_rate+Very_rare_rate+Legendary_rate) > 20 then
				if not Get("DisableMessageBoxes") then
					OpenMessageBox(GetHostCharacter(), Gacha_Exploit_MSG)
				end
			else
				Generate_multiple_loot(ID2, "")
				if Get("EnableContinuum") and Return_to_sender > 0 then
					if Osi.TimerExists("Anomaly") == 1 and Osi.TimerExists("SaveLoaded") == 1 then
						RandomEffect()
						Osi.TimerCancel("Anomaly")
					end
				end
			end
			Free_roll = Free_roll - 1
			REL_ResetStatuses()
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 1 and GetDisplayName(ID2) ~= "h42cf1b05g5c7cg45c4g86aeg77f3d26d069c"
				and GetDisplayName(ID2) ~= "h6c9d8242g3ec9g4f49ga9c6gae77e563b90b" and GetDisplayName(ID2) ~= "hebaec8d0ge9e4g4af8g9db9g5f4766c93433" 
				and GetGold(ID2) == Get("Gacha_Price") then
			RemoveStatus(ID2,"LOOT_DISTRIBUTED_OBJECT")
			AddGold(ID2, -Get("Gacha_Price"))
			AddGold("0133f2ad-e121-4590-b5f0-a79413919805", Get("Gacha_Price"))
		elseif HasActiveStatus(ID2, "LOOT_DISTRIBUTED_OBJECT") == 1 and Get("Sacrifice") and Get("SacrificeCount") >= 2 then
			if #Ext.Entity.Get(ID2).InventoryOwner.Inventories[1].InventoryContainer.Items == Get("SacrificeCount") then 
				local count = 0
				local rarity = nil
				local pulled_list =  GetUniqueGears(ID2,"Sacrifice")
				for _, v in pairs(pulled_list) do
					rarity = v.Value.Rarity
					break
				end
				local index = {}
				for k, v in pairs(pulled_list) do
					local check = v.Value.Rarity
					if IsEquipable(v.Uuid.EntityUuid) == 1 and check == rarity and rarity ~= 4 then
						count = count + 1
						table.insert(index,k)
					end
				end
				if count == Get("SacrificeCount") and rarity ~= 4 then
					for i = #index,1,-1 do
						print("[REL_SE] Sacrificing "..ResolveTranslatedString(pulled_list[index[i]].DisplayName.NameKey.Handle.Handle))
						local ID = pulled_list[index[i]].Uuid.EntityUuid
						local check = pulled_list[index[i]].GameObjectVisual.RootTemplateId
						if CountInstances(Mods.REL_SE.PersistentVars.Dropped,check) == 0 and
						(CountInstances(UUIDS,check) + CountInstances(Looted_UUIDS,check) > 0) and not Get("Duplicate") then
							local where = FindIndices(UUIDS,check)[1]
							if where then
								table.insert(Mods.REL_SE.PersistentVars.Dropped,UUIDS[where])
							else
								table.insert(Mods.REL_SE.PersistentVars.Dropped,Looted_UUIDS[FindIndices(Looted_UUIDS,check)[1]])
							end
						end
						if (CountInstances(UUIDS,check) and CountInstances(UUIDS,check) > 0) and not Get("Duplicate") then
							local loop_index = FindIndices(UUIDS,check)[1]
							if Rarities[loop_index] ~= "cosmetic" then
								table.insert(Mods.REL_SE.PersistentVars.Dropped,UUIDS[loop_index])
								table.insert(Looted_names, Names[loop_index])
								table.insert(Looted_rarities, Rarities[loop_index])
								table.insert(Looted_UUIDS, UUIDS[loop_index])
								table.insert(Looted_types, Types[loop_index])
								if not Act[loop_index] then
									for f = 1,loop_index do
										Act[f] = " "
									end
								end
								table.insert(Looted_acts,Act[loop_index])
								table.remove(Act,loop_index)
								table.remove(Names, loop_index)
								table.remove(Rarities, loop_index)
								table.remove(UUIDS, loop_index)
								table.remove(Types,loop_index)
							end
						end
						Write_and_save(REL_Lootlist, Names, UUIDS, Rarities, Types, Act)
						Write_and_save(REL_ShadowRealm, Looted_names, Looted_UUIDS, Looted_rarities, Looted_types, Looted_acts)
						RequestDelete(ID)
					end
					if rarity == 3 then
						Generate_loot(ID2,0,0,0,10,true)
					elseif rarity == 2 then
						Generate_loot(ID2,0,0,10,0,true)
					else
						Generate_loot(ID2,0,10,0,0,true)
					end
				end
			end
		end
		::fail::
	end
end)

Ext.Events.GameStateChanged:Subscribe(function(e)
	if e.ToState == "Running" then
		REL_GetStatusesConfig()
		if not Mods.REL_SE.PersistentVars then
			Mods.REL_SE.PersistentVars = {}
		end
		if not Mods.REL_SE.PersistentVars.Trader then
			Mods.REL_SE.PersistentVars.Trader = {}
			Mods.REL_SE.PersistentVars.Trader.StatusRemoved = {}
			Mods.REL_SE.PersistentVars.Trader.Shuffled = {}
			Mods.REL_SE.PersistentVars.Trader.Generated = {}
		end
		if not Mods.REL_SE.PersistentVars.Misc then
			Mods.REL_SE.PersistentVars.Misc = {}
		end
		if not Mods.REL_SE.PersistentVars.Dropped then
			Mods.REL_SE.PersistentVars.Dropped = {}
		end
		LoadedLootCheck()
		REL_GetStatusesConfig()
		if Get("EnableContinuum") then
			if type(CMND or 0) == "string" and (Haste_count or 0) > 0 then
				TimerLaunch("Repeated_haste"..CMND, 15000)
			end
			if type(Victim) == "string" then
				TimerLaunch(Victim, 5000)
			end
			if type(IOU) == "string" then
				TimerLaunch(IOU, 10000)
			end
			if Charismatic and #Charismatic> 10 and GetAbility(Charismatic, "Charisma") < 38 then
				AddBoosts(Charismatic,"Ability(Charisma,"..Global_y..",99)","",Charismatic)
			end
		end
	end
end) 

Ext.Osiris.RegisterListener("ShortRested",1,"after", function(_)
	if Get("ShortRestRate") > 0 and Get("RealEconomy") then
		Mods.REL_SE.PersistentVars.Misc.Shuffle = Get("ShortRestRate")
		Mods.REL_SE.PersistentVars.Trader.Shuffled = {}
	end
end)

Ext.Osiris.RegisterListener("SavegameLoaded",0,"after",function()
	TimerLaunch("SaveLoaded",Get("ContinuumTimer")*1000)
end)