$(function() {
	Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010 Q1',
            Tempo: 2647
        }, {
            period: '2010 Q2',
            Tempo: 2441
        }, {
            period: '2010 Q3',
            Tempo: 2501
        }, {
            period: '2011 Q4',
            Tempo: 5689
        }, {
            period: '2011 Q1',
            Tempo: 2293
        }, {
            period: '2012 Q2',
            Tempo: 1881
        }, {
            period: '2013 Q3',
            Tempo: 1588
        }, {
            period: '2014 Q4',
            Tempo: 5175
        }, {
            period: '2014 Q1',
            Tempo: 2028
        }, {
            period: '2015 Q4',
            Tempo: 1791
        }],
        xkey: 'period',
        ykeys: ['Tempo'],
        labels: ['Tempo'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 10
        },{
            label: "In-Store Sales",
            value: 05
        },{
            label: "In-Store Sales",
            value: 20
        }, {
            label: "Mail-Order Sales",
            value: 08
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            b: 90
        }, {
            b: 65
        }, {
            b: 40
        }, {
            b: 65
        }, {
            b: 40
        }, {
            b: 65
        }, {
            b: 30
        }, {
            b: 90
        }],
        xkey: false,
        ykeys: ['b'],
        labels: ['Situação'],
        hideHover: 'auto',
        resize: true
    });
    
});
