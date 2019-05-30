//chart0
$(document).ready(function ()
{
    var chart0_data = [];
    var chart0_date_start = '';
    var chart0_date_end   = '';
    var chart0_manager_id = '1';


    $('#chart0-date-start').datepicker({ language: 'ru', endDate: '0', autoclose: true, zIndexOffset: 1000 });
    $('#chart0-date-end').datepicker({ language: 'ru', endDate: '0', autoclose: true, zIndexOffset: 1000 });


    $('.input-daterange').change(function()
    {
        chart0_date_start = $('#chart0-date-start').val();
        chart0_date_end   = $('#chart0-date-end').val();

        console.log('date_start: ' + chart0_date_start);
        console.log('date_end: ' + chart0_date_end);


        chart0_ajax();
    });

    $('#chart0-select-manager').change(function () {
        chart0_manager_id = $('#chart0-select-manager').val();

        console.log('manager: ' + chart0_manager_id);

        chart0_ajax();

    });


    chart0_ajax();


    function create_chart0() {
        var chart0 = new CanvasJS.Chart("chart0_container", {
            animationEnabled: true,
            title: {
                text: "График продаж"
            },
            axisX: {
                valueFormatString: "DD/MM/YY"
            },
            axisY: {
                // title: "Count",
                includeZero: false,
            },
            legend: {
                cursor: "pointer",
                fontSize: 16,
                itemclick: toggleDataSeries
            },
            toolTip: {
                shared: true
            },
            data: [{
                name: "Количество оформленных туров",
                type: "line",
                showInLegend: true,
                dataPoints: chart0_data
            }]
        }).render();
    }

    function chart0_ajax() {
        $.ajax({
            type: 'POST',
            url: "/home/chart0",
            data: {date_start: chart0_date_start, date_end: chart0_date_end, manager: chart0_manager_id},
            dataType: "json",
            success:function(data)
            {
                chart0_data = [];
                addData(data,chart0_data);
                create_chart0();
            },
            error:function(data)
            {
                console.log('ERROR');
            }
        });
    }
});




//chart1
$(document).ready(function () {

    var chart1_data = [];
    var chart1_date_start = '';
    var chart1_date_end   = '';


    $('#chart1-date-start').datepicker({ language: 'ru', endDate: '0', autoclose: true, zIndexOffset: 1000 });
    $('#chart1-date-end').datepicker({ language: 'ru', endDate: '0', autoclose: true, zIndexOffset: 1000 });


    $('.input-daterange').change(function()
    {
        chart1_date_start = $('#chart1-date-start').val();
        chart1_date_end   = $('#chart1-date-end').val();

        console.log('date_start: ' + chart1_date_start);
        console.log('date_end: ' + chart1_date_end);


        chart1_ajax();
    });

    chart1_ajax();


    function create_chart1() {
        var chart1 = new CanvasJS.Chart("chart1_container", {
            animationEnabled: true,
            title: {
                text: "Title"
            },
            axisX: {
                valueFormatString: "DD/MM/YY"
            },
            axisY: {
                // title: "Count",
                includeZero: false,
            },
            legend: {
                cursor: "pointer",
                fontSize: 16,
                itemclick: toggleDataSeries
            },
            toolTip: {
                shared: true
            },
            data: [{
                name: "something",
                type: "column",
                showInLegend: true,
                dataPoints: chart1_data
            }]
        }).render();
    }

    function chart1_ajax() {
        $.ajax({
            type: 'POST',
            url: "/home/chart1",
            data: {date_start: chart1_date_start, date_end: chart1_date_end},
            dataType: "json",
            success:function(data)
            {
                chart1_data = data;
                create_chart1();
            },
            error:function(data)
            {
                console.log('ERROR');
            }
        });
    }
});



function addData(data,result)
{
    for (var i = 0; i < data.length; i++) {
        result.push({
            x: new Date(data[i].x),
            y: data[i].y
        });
    }
}



function toggleDataSeries(e)
{
    if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        e.dataSeries.visible = false;
    }
    else{
        e.dataSeries.visible = true;
    }
    chart0.render();
}