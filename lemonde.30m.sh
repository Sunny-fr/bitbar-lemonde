#!/usr/bin/env /usr/local/bin/node

var request = require('request');
var $ = require('cheerio');

request('http://www.lemonde.fr', function (error, response, html) {
      if (!error && response.statusCode == 200) {
        var block = $('[data-vr-zone="bloc_en_continu"] .pages', html).eq(0);
        var page = block.eq(0).find('ul').eq(0);
        var pageLinks = page.find('li');
        for (var i = 0; i < 3 ; i++) {
        	var item = pageLinks[i] ;
        	var h = $(item).find('.heure').text();
        	var txt = $(item).find('.texte').text();
            var href = $(item).find('a').attr('href');
            var dhref = '/' + $(item).find('[data-href]').attr('data-href');
            var title = (href ? '📰  ' : '')  + h + ' : ' + txt
			          console.log( title );
        };
        console.log("---")
        for (var i = 0; i < pageLinks.length; i++) {
        	var item = pageLinks[i] ;
        	var h = $(item).find('.heure').text();
        	var txt = $(item).find('.texte').text();
            var href = $(item).find('a').attr('href');
            var dhref = '/' + $(item).find('[data-href]').attr('data-href');
            var title = (href ? '📰  ' : '')  + h + ' : ' + txt
            var link = 'href="http://www.lemonde.fr' + ( href || dhref ) + '"'
			          console.log( title + ' | ' + link );
        };
      }
    });
