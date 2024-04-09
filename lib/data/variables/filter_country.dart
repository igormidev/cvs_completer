/// These are the countries that the player can select in DSF app.
enum FilterAppContry {
  brazil,
  argentina,
  bolivia,
  chile,
  colombia,
  ecuador,
  paraguai,
  peru,
  uruguay,
  venezuela,
  german,
  france,
  unitedKingdom,
  italy,
  portugal,
  spanish,
  russia,
  china,
  holanda,
  india,
  japao,
  southCorea,
  turkey,
  unitedStates,
  mexico,
  angola,
  romenia,
  serbia,
  austria,
  hungary,
  nigeria,
  ghana,
  senegal,
  coteDIvore,
  cameroon,
  norway,
  belgium,
  switzerland,
  finland,
  ireland,
  ukraine,
  sweden,
  morocco,
  albania,
  bulgaria,
  congo,
  greece,
  poland,
  bosniaAndHerzegovina,
  montenegro,
  denmark,
  australia,
  jamaica,
  georgia,
  caboVerde,
  uzbekistan,
  philippines,
  macedonia,
  curacao,
  seychelles,
  kosovo,
  guinea,
  slovenia,
  mali,
  panama,
  newZealand,
  iceland,
  canada,
  guineaBissau,
  suriname,
  belarus,
  thailand,
  costaRica,
  southAfrica,
  dRCongo,
  palestine,
  togo,
  slovakia,
  gabon,
  croatia,
  gambia,
  lithuania,
  moldovia,
  liberia,
  tunisia,
  lebanon,
  israel,
  martinique,
  iraq,
  algeria,
  luxembourg,
  czechia,
  sierraLeone,
  guadeloupe,
  mauritania,
  burkinaFaso,
  unknown,
  ;

  static FilterAppContry fromCode(String code) {
    switch (code) {
      case 'BR':
        return FilterAppContry.brazil;
      case 'AR':
        return FilterAppContry.argentina;
      case 'BO':
        return FilterAppContry.bolivia;
      case 'CL':
        return FilterAppContry.chile;
      case 'CO':
        return FilterAppContry.colombia;
      case 'EC':
        return FilterAppContry.ecuador;
      case 'PY':
        return FilterAppContry.paraguai;
      case 'PE':
        return FilterAppContry.peru;
      case 'UY':
        return FilterAppContry.uruguay;
      case 'VE':
        return FilterAppContry.venezuela;
      case 'DE':
        return FilterAppContry.german;
      case 'FR':
        return FilterAppContry.france;
      case 'GB':
        return FilterAppContry.unitedKingdom;
      case 'IT':
        return FilterAppContry.italy;
      case 'PT':
        return FilterAppContry.portugal;
      case 'ES':
        return FilterAppContry.spanish;
      case 'RU':
        return FilterAppContry.russia;
      case 'CN':
        return FilterAppContry.china;
      case 'NL':
        return FilterAppContry.holanda;
      case 'IN':
        return FilterAppContry.india;
      case 'JP':
        return FilterAppContry.japao;
      case 'KR':
        return FilterAppContry.southCorea;
      case 'TR':
        return FilterAppContry.turkey;
      case 'US':
        return FilterAppContry.unitedStates;
      case 'MX':
        return FilterAppContry.mexico;
      case 'AO':
        return FilterAppContry.angola;
      case 'RO':
        return FilterAppContry.romenia;
      case 'RS':
        return FilterAppContry.serbia;
      case 'AT':
        return FilterAppContry.austria;
      case 'HU':
        return FilterAppContry.hungary;
      case 'NG':
        return FilterAppContry.nigeria;
      case 'GH':
        return FilterAppContry.ghana;
      case 'SN':
        return FilterAppContry.senegal;
      case 'CI':
        return FilterAppContry.coteDIvore;
      case 'CM':
        return FilterAppContry.cameroon;
      case 'NO':
        return FilterAppContry.norway;
      case 'BE':
        return FilterAppContry.belgium;
      case 'CH':
        return FilterAppContry.switzerland;
      case 'FI':
        return FilterAppContry.finland;
      case 'IR':
        return FilterAppContry.ireland;
      case 'UA':
        return FilterAppContry.ukraine;
      case 'SE':
        return FilterAppContry.sweden;
      case 'MA':
        return FilterAppContry.morocco;
      case 'AL':
        return FilterAppContry.albania;
      case 'BG':
        return FilterAppContry.bulgaria;
      case 'CG':
        return FilterAppContry.congo;
      case 'GR':
        return FilterAppContry.greece;
      case 'PL':
        return FilterAppContry.poland;
      case 'BA':
        return FilterAppContry.bosniaAndHerzegovina;
      case 'ME':
        return FilterAppContry.montenegro;
      case 'DK':
        return FilterAppContry.denmark;
      case 'AU':
        return FilterAppContry.australia;
      case 'JM':
        return FilterAppContry.jamaica;
      case 'GE':
        return FilterAppContry.georgia;
      case 'CV':
        return FilterAppContry.caboVerde;
      case 'UZ':
        return FilterAppContry.uzbekistan;
      case 'PH':
        return FilterAppContry.philippines;
      case 'MK':
        return FilterAppContry.macedonia;
      case 'CW':
        return FilterAppContry.curacao;
      case 'SC':
        return FilterAppContry.seychelles;
      case 'XK':
        return FilterAppContry.kosovo;
      case 'GN':
        return FilterAppContry.guinea;
      case 'SI':
        return FilterAppContry.slovenia;
      case 'ML':
        return FilterAppContry.mali;
      case 'PA':
        return FilterAppContry.panama;
      case 'NZ':
        return FilterAppContry.newZealand;
      case 'IS':
        return FilterAppContry.iceland;
      case 'CA':
        return FilterAppContry.canada;
      case 'GW':
        return FilterAppContry.guineaBissau;
      case 'SR':
        return FilterAppContry.suriname;
      case 'BY':
        return FilterAppContry.belarus;
      case 'TH':
        return FilterAppContry.thailand;
      case 'CR':
        return FilterAppContry.costaRica;
      case 'ZA':
        return FilterAppContry.southAfrica;
      case 'CD':
        return FilterAppContry.dRCongo;
      case 'PS':
        return FilterAppContry.palestine;
      case 'TG':
        return FilterAppContry.togo;
      case 'SK':
        return FilterAppContry.slovakia;
      case 'GA':
        return FilterAppContry.gabon;
      case 'HR':
        return FilterAppContry.croatia;
      case 'GM':
        return FilterAppContry.gambia;
      case 'LT':
        return FilterAppContry.lithuania;
      case 'MD':
        return FilterAppContry.moldovia;
      case 'LR':
        return FilterAppContry.liberia;
      case 'TN':
        return FilterAppContry.tunisia;
      case 'LB':
        return FilterAppContry.lebanon;
      case 'IL':
        return FilterAppContry.israel;
      case 'MQ':
        return FilterAppContry.martinique;
      case 'IQ':
        return FilterAppContry.iraq;
      case 'DZ':
        return FilterAppContry.algeria;
      case 'LU':
        return FilterAppContry.luxembourg;
      case 'CZ':
        return FilterAppContry.czechia;
      case 'SL':
        return FilterAppContry.sierraLeone;
      case 'GP':
        return FilterAppContry.guadeloupe;
      case 'MR':
        return FilterAppContry.mauritania;
      case 'BF':
        return FilterAppContry.burkinaFaso;
      default:
        return FilterAppContry.unknown;
    }
  }

  String getCountryName() {
    switch (this) {
      case FilterAppContry.brazil:
        return 'Brazil';
      case FilterAppContry.spanish:
        return 'Spanish';
      case FilterAppContry.portugal:
        return 'Portugal';
      case FilterAppContry.argentina:
        return 'Argentina';
      case FilterAppContry.bolivia:
        return 'Bolivia';
      case FilterAppContry.chile:
        return 'Chile';
      case FilterAppContry.colombia:
        return 'Colombia';
      case FilterAppContry.ecuador:
        return 'Ecuador';
      case FilterAppContry.paraguai:
        return 'Paraguai';
      case FilterAppContry.peru:
        return 'Peru';
      case FilterAppContry.uruguay:
        return 'Uruguay';
      case FilterAppContry.venezuela:
        return 'Venezuela';
      case FilterAppContry.german:
        return 'German';
      case FilterAppContry.france:
        return 'France';
      case FilterAppContry.unitedKingdom:
        return 'United Kingdom';
      case FilterAppContry.italy:
        return 'Italy';
      case FilterAppContry.russia:
        return 'Russia';
      case FilterAppContry.china:
        return 'China';
      case FilterAppContry.holanda:
        return 'Holanda';
      case FilterAppContry.india:
        return 'India';
      case FilterAppContry.japao:
        return 'Japan';
      case FilterAppContry.southCorea:
        return 'South Corea';
      case FilterAppContry.turkey:
        return 'Turkey';
      case FilterAppContry.angola:
        return 'Angola';
      case FilterAppContry.unitedStates:
        return 'United States';
      case FilterAppContry.mexico:
        return 'Mexico';
      case FilterAppContry.romenia:
        return 'Romenia';
      case FilterAppContry.serbia:
        return 'Serbia';
      case FilterAppContry.austria:
        return 'Austria';
      case FilterAppContry.hungary:
        return 'Hungary';
      case FilterAppContry.nigeria:
        return 'Nigeria';
      case FilterAppContry.ghana:
        return 'Ghana';
      case FilterAppContry.senegal:
        return 'Senegal';
      case FilterAppContry.coteDIvore:
        return 'Cote D\'Ivore';
      case FilterAppContry.cameroon:
        return 'Cameroon';
      case FilterAppContry.norway:
        return 'Norway';
      case FilterAppContry.belgium:
        return 'Belgium';
      case FilterAppContry.switzerland:
        return 'Switzerland';
      case FilterAppContry.finland:
        return 'Finland';
      case FilterAppContry.ireland:
        return 'Ireland';
      case FilterAppContry.ukraine:
        return 'Ukraine';
      case FilterAppContry.sweden:
        return 'Sweden';
      case FilterAppContry.morocco:
        return 'Morocco';
      case FilterAppContry.albania:
        return 'Albania';
      case FilterAppContry.bulgaria:
        return 'Bulgaria';
      case FilterAppContry.congo:
        return 'Congo';
      case FilterAppContry.greece:
        return 'Greece';
      case FilterAppContry.poland:
        return 'Poland';
      case FilterAppContry.bosniaAndHerzegovina:
        return 'Bosnia';
      case FilterAppContry.montenegro:
        return 'Montenegro';
      case FilterAppContry.denmark:
        return 'Denmark';
      case FilterAppContry.australia:
        return 'Australia';
      case FilterAppContry.jamaica:
        return 'Jamaica';
      case FilterAppContry.georgia:
        return 'Georgia';
      case FilterAppContry.caboVerde:
        return 'Cabo Verde';
      case FilterAppContry.uzbekistan:
        return 'Uzbekistan';
      case FilterAppContry.philippines:
        return 'Philippines';
      case FilterAppContry.macedonia:
        return 'Macedonia';
      case FilterAppContry.curacao:
        return 'Curaçao';
      case FilterAppContry.seychelles:
        return 'Seychelles';
      case FilterAppContry.kosovo:
        return 'Kosovo';
      case FilterAppContry.guinea:
        return 'Guinea';
      case FilterAppContry.slovenia:
        return 'Slovenia';
      case FilterAppContry.mali:
        return 'Mali';
      case FilterAppContry.panama:
        return 'Panama';
      case FilterAppContry.newZealand:
        return 'New Zealand';
      case FilterAppContry.iceland:
        return 'Iceland';
      case FilterAppContry.canada:
        return 'Canada';
      case FilterAppContry.guineaBissau:
        return 'Guinea Bissau';
      case FilterAppContry.suriname:
        return 'Suriname';
      case FilterAppContry.belarus:
        return 'Belarus';
      case FilterAppContry.thailand:
        return 'Thailand';
      case FilterAppContry.costaRica:
        return 'Costa Rica';
      case FilterAppContry.southAfrica:
        return 'South Africa';
      case FilterAppContry.dRCongo:
        return 'DR Congo';
      case FilterAppContry.palestine:
        return 'Palestine';
      case FilterAppContry.togo:
        return 'Togo';
      case FilterAppContry.slovakia:
        return 'Slovakia';
      case FilterAppContry.gabon:
        return 'Gabon';
      case FilterAppContry.croatia:
        return 'Croatia';
      case FilterAppContry.gambia:
        return 'Gambia';
      case FilterAppContry.lithuania:
        return 'Lithuania';
      case FilterAppContry.moldovia:
        return 'Moldovia';
      case FilterAppContry.liberia:
        return 'Liberia';
      case FilterAppContry.tunisia:
        return 'Tunisia';
      case FilterAppContry.lebanon:
        return 'Lebanon';
      case FilterAppContry.israel:
        return 'Israel';
      case FilterAppContry.martinique:
        return 'Martinique';
      case FilterAppContry.iraq:
        return 'Iraq';
      case FilterAppContry.algeria:
        return 'Algeria';
      case FilterAppContry.luxembourg:
        return 'Luxembourg';
      case FilterAppContry.czechia:
        return 'Czechia';
      case FilterAppContry.sierraLeone:
        return 'Sierra Leone';
      case FilterAppContry.guadeloupe:
        return 'Guadeloupe';
      case FilterAppContry.mauritania:
        return 'Mauritania';
      case FilterAppContry.burkinaFaso:
        return 'Burkina Faso';
      case FilterAppContry.unknown:
        return 'Unknown';
    }
  }

  String? getImagePath() {
    switch (this) {
      case FilterAppContry.brazil:
        return 'asset/country_icons/brazil.png';
      case FilterAppContry.spanish:
        return 'asset/country_icons/spain.png';
      case FilterAppContry.portugal:
        return 'asset/country_icons/portugal.png';
      case FilterAppContry.argentina:
        return 'asset/country_icons/argentina.png';
      case FilterAppContry.bolivia:
        return 'asset/country_icons/bolivia.png';
      case FilterAppContry.chile:
        return 'asset/country_icons/chile.png';
      case FilterAppContry.colombia:
        return 'asset/country_icons/colombia.png';
      case FilterAppContry.ecuador:
        return 'asset/country_icons/equador.png';
      case FilterAppContry.paraguai:
        return 'asset/country_icons/paraguai.png';
      case FilterAppContry.peru:
        return 'asset/country_icons/peru.png';
      case FilterAppContry.uruguay:
        return 'asset/country_icons/uruguai.png';
      case FilterAppContry.venezuela:
        return 'asset/country_icons/venezuela.png';
      case FilterAppContry.german:
        return 'asset/country_icons/german.png';
      case FilterAppContry.france:
        return 'asset/country_icons/france.png';
      case FilterAppContry.unitedKingdom:
        return 'asset/country_icons/united_kingdom.png';
      case FilterAppContry.italy:
        return 'asset/country_icons/italy.png';
      case FilterAppContry.russia:
        return 'asset/country_icons/russia.png';
      case FilterAppContry.china:
        return 'asset/country_icons/china.png';
      case FilterAppContry.holanda:
        return 'asset/country_icons/holanda.png';
      case FilterAppContry.india:
        return 'asset/country_icons/india.png';
      case FilterAppContry.japao:
        return 'asset/country_icons/japao.png';
      case FilterAppContry.southCorea:
        return 'asset/country_icons/southcoreia.png';
      case FilterAppContry.turkey:
        return 'asset/country_icons/turquia.png';
      case FilterAppContry.angola:
        return 'asset/country_icons/angola.png';
      case FilterAppContry.mexico:
        return 'asset/country_icons/mexico.png';
      case FilterAppContry.unitedStates:
        return 'asset/country_icons/united-states.png';
      case FilterAppContry.romenia:
        return 'asset/country_icons/romenia.png';
      case FilterAppContry.serbia:
        return 'asset/country_icons/servia.png';
      case FilterAppContry.austria:
        return 'asset/country_icons/austria.png';
      case FilterAppContry.hungary:
        return 'asset/country_icons/hungary.png';
      case FilterAppContry.nigeria:
        return 'asset/country_icons/nigeria.png';
      case FilterAppContry.ghana:
        return 'asset/country_icons/ghana.png';
      case FilterAppContry.senegal:
        return 'asset/country_icons/senegal.png';
      case FilterAppContry.coteDIvore:
        return 'asset/country_icons/cote-divoire.png';
      case FilterAppContry.cameroon:
        return 'asset/country_icons/cameroon.png';
      case FilterAppContry.norway:
        return 'asset/country_icons/norway.png';
      case FilterAppContry.belgium:
        return 'asset/country_icons/belgium.png';
      case FilterAppContry.switzerland:
        return 'asset/country_icons/switzerland.png';
      case FilterAppContry.finland:
        return 'asset/country_icons/finland.png';
      case FilterAppContry.ireland:
        return 'asset/country_icons/ireland.png';
      case FilterAppContry.ukraine:
        return 'asset/country_icons/ukraine.png';
      case FilterAppContry.sweden:
        return 'asset/country_icons/sweden.png';
      case FilterAppContry.morocco:
        return 'asset/country_icons/morocco.png';
      case FilterAppContry.albania:
        return 'asset/country_icons/albania.png';

      case FilterAppContry.bulgaria:
        return 'asset/country_icons/bulgaria.png';
      case FilterAppContry.congo:
        return 'asset/country_icons/congo.png';
      case FilterAppContry.greece:
        return 'asset/country_icons/greece.png';
      case FilterAppContry.poland:
        return 'asset/country_icons/poland.png';
      case FilterAppContry.bosniaAndHerzegovina:
        return 'asset/country_icons/bosnia.png';
      case FilterAppContry.montenegro:
        return 'asset/country_icons/montenegro.png';
      case FilterAppContry.denmark:
        return 'asset/country_icons/denmark.png';
      case FilterAppContry.australia:
        return 'asset/country_icons/australia.png';
      case FilterAppContry.jamaica:
        return 'asset/country_icons/jamaica.png';
      case FilterAppContry.georgia:
        return 'asset/country_icons/georgia.png';
      case FilterAppContry.caboVerde:
        return 'asset/country_icons/cabo-verde.png';
      case FilterAppContry.uzbekistan:
        return 'asset/country_icons/uzbekistan.png';
      case FilterAppContry.philippines:
        return 'asset/country_icons/philippines.png';
      case FilterAppContry.macedonia:
        return 'asset/country_icons/macedonia.png';
      case FilterAppContry.curacao:
        return 'asset/country_icons/curacao.png';
      case FilterAppContry.seychelles:
        return 'asset/country_icons/seychelles.png';
      case FilterAppContry.kosovo:
        return 'asset/country_icons/kosovo.png';
      case FilterAppContry.guinea:
        return 'asset/country_icons/guinea.png';
      case FilterAppContry.slovenia:
        return 'asset/country_icons/slovenia.png';
      case FilterAppContry.mali:
        return 'asset/country_icons/mali.png';
      case FilterAppContry.panama:
        return 'asset/country_icons/panama.png';
      case FilterAppContry.newZealand:
        return 'asset/country_icons/new-zealand.png';
      case FilterAppContry.iceland:
        return 'asset/country_icons/islandia.png';
      case FilterAppContry.canada:
        return 'asset/country_icons/canada.png';
      case FilterAppContry.guineaBissau:
        return 'asset/country_icons/guinea-bissau.png';
      case FilterAppContry.suriname:
        return 'asset/country_icons/suriname.png';
      case FilterAppContry.belarus:
        return 'asset/country_icons/belarus.png';
      case FilterAppContry.thailand:
        return 'asset/country_icons/thailand.png';
      case FilterAppContry.costaRica:
        return 'asset/country_icons/costa-rica.png';
      case FilterAppContry.southAfrica:
        return 'asset/country_icons/south-africa.png';
      case FilterAppContry.dRCongo:
        return 'asset/country_icons/democratic-republic-congo.png';
      case FilterAppContry.palestine:
        return 'asset/country_icons/palestine.png';
      case FilterAppContry.togo:
        return 'asset/country_icons/togo.png';
      case FilterAppContry.slovakia:
        return 'asset/country_icons/slovakia.png';
      case FilterAppContry.gabon:
        return 'asset/country_icons/gabon.png';
      case FilterAppContry.croatia:
        return 'asset/country_icons/croatia.png';
      case FilterAppContry.gambia:
        return 'asset/country_icons/gambia.png';
      case FilterAppContry.lithuania:
        return 'asset/country_icons/lithuania.png';
      case FilterAppContry.moldovia:
        return 'asset/country_icons/moldova.png';
      case FilterAppContry.liberia:
        return 'asset/country_icons/liberia.png';
      case FilterAppContry.tunisia:
        return 'asset/country_icons/tunisia.png';
      case FilterAppContry.lebanon:
        return 'asset/country_icons/lebanon.png';
      case FilterAppContry.israel:
        return 'asset/country_icons/israel.png';
      case FilterAppContry.martinique:
        return 'asset/country_icons/martinique.png';
      case FilterAppContry.iraq:
        return 'asset/country_icons/iraq.png';
      case FilterAppContry.algeria:
        return 'asset/country_icons/algeria.png';
      case FilterAppContry.luxembourg:
        return 'asset/country_icons/luxembourg.png';
      case FilterAppContry.czechia:
        return 'asset/country_icons/czechia.png';
      case FilterAppContry.sierraLeone:
        return 'asset/country_icons/sierra-leone.png';
      case FilterAppContry.guadeloupe:
        return 'asset/country_icons/guadeloupe.png';
      case FilterAppContry.mauritania:
        return 'asset/country_icons/mauritania.png';
      case FilterAppContry.burkinaFaso:
        return 'asset/country_icons/burkina-faso.png';
      case FilterAppContry.unknown:
        return null;
    }
  }
}
