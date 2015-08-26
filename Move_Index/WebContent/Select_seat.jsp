<%-- 
    Document   : Select_seat
    Created on : Aug 25, 2015, 11:38:16 PM
    Author     : chenwesley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width = device-width">
        <link rel="stylesheet" type="text/css" href="jquery.seat-charts.css">
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="jquery.seat-charts.min.js"></script>
    </head>
    <body>
        <div id="page">
            <div class="section header clear">

                <div class="author-details">

                    <script cf-hash="f9e31" type="text/javascript">
                        /* <![CDATA[ */!function () {
                            try {
                                var t = "currentScript"in document ? document.currentScript : function () {
                                    for (var t = document.getElementsByTagName("script"), e = t.length; e--; )
                                        if (t[e].getAttribute("cf-hash"))
                                            return t[e]
                                }();
                                if (t && t.previousSibling) {
                                    var e, r, n, i, c = t.previousSibling, a = c.getAttribute("data-cfemail");
                                    if (a) {
                                        for (e = "", r = parseInt(a.substr(0, 2), 16), n = 2; a.length - n; n += 2)
                                            i = parseInt(a.substr(n, 2), 16) ^ r, e += String.fromCharCode(i);
                                        e = document.createTextNode(e), c.parentNode.replaceChild(e, c)
                                    }
                                }
                            } catch (u) {
                            }
                        }();/* ]]> */
                    </script>
                </div>
            </div>
            <div class="section">
                <h2 id="toc">Dear customer,</h2>
                <h3 id="1">pick up seats</h3>
            </div>
            <div class="results"></div>



            <style type="text/css">
                .demo{
                    width:700px; 
                    margin:40px 
                        auto 0 auto; 
                    min-height:450px;
                }
                @media screen and (max-width: 360px) {.demo {width:340px}}
                .front{
                    width: 300px;
                    margin: 5px 32px 45px 32px;
                    background-color: #f0f0f0;
                    color: #666;
                    text-align: 
                        center;
                    padding: 3px;
                    border-radius: 5px;
                }
                .booking-details {
                    float: right;
                    position: relative;
                    width:200px;
                    height: 450px; 
                }
                .booking-details h3 {
                    margin: 5px 5px 0 0;
                    font-size: 16px;
                }
                .booking-details p{
                    line-height:26px; 
                    font-size:16px; 
                    color:#999
                }
                .booking-details p span{color:#666}
                div.seatCharts-cell{
                    color: #182C4E;
                    height: 25px;
                    width: 25px;
                    line-height: 25px;
                    margin: 3px;
                    float: left;
                    text-align: 
                        center;outline: none;
                    font-size: 13px;
                }
                div.seatCharts-seat {
                    color: #fff;
                    cursor: pointer;
                    -webkit-border-radius: 5px;
                    -moz-border-radius: 5px;
                    border-radius: 5px;
                }
                div.seatCharts-row {
                    height: 35px;
                }
                div.seatCharts-seat.available {
                    background-color: #B9DEA0;
                }
                div.seatCharts-seat.focused {
                    background-color: #76B474;
                    border: none;
                }
                div.seatCharts-seat.selected {
                    background-color: #E6CAC4;
                }
                div.seatCharts-seat.unavailable {
                    background-color: #472B34;
                    cursor: not-allowed;
                }
                div.seatCharts-container {
                    border-right: 1px dotted #adadad;
                    width: 400px;
                    padding: 20px;
                    float: left;
                }
                div.seatCharts-legend {
                    padding-left: 0px;
                    position: absolute;
                    bottom: 16px;
                }
                ul.seatCharts-legendList {
                    padding-left: 0px;
                }
                .seatCharts-legendItem{
                    float:left; width:90px;
                    margin-top: 10px;
                    line-height: 2;
                }
                span.seatCharts-legendDescription {
                    margin-left: 5px;
                    line-height: 30px;
                }
                .checkout-button{
                    display: block;
                    width:80px; 
                    height:24px; 
                    line-height:20px;
                    margin: 10px auto;
                    border:1px solid #999;
                    font-size: 14px; 
                    cursor:pointer
                }
                #selected-seats {
                    max-height: 150px;
                    overflow-y: auto;
                    overflow-x: none;
                    width: 200px;
                }
                #selected-seats li{
                    float:left; 
                    width:72px; 
                    height:26px; 
                    line-height:26px; 
                    border:1px solid #d3d3d3; 
                    background:#f7f7f7; 
                    margin:6px; font-size:14px; 
                    font-weight:bold; 
                    text-align:center
                }
            </style>

            <div class="demo">

                <div id="seat-map" class="seatCharts-container" tabindex="0" aria-activedescendant="1_0">

                    <div class="front">SCREEN</div>
                    <!-- 會自己新增出列表 -->    
                </div>

                <div class="booking-details">

                    <p>Movie: <span> <%=new String(request.getParameter("mgId").getBytes( "ISO-8859-1"), "UTF-8")%></span></p>
                    <p>Time: <span><%=request.getParameter("todays_date")%></span></p>
                    <p>People: <%=request.getParameter("ticketQuantity")%></p>
                    <p>起: <%=request.getParameter("sessionTimeStart")%> 迄: <%=request.getParameter("sessionTimeEnd")%></p>
                    <p>Seat: </p>
                    <ul id="selected-seats">
                        <!-- 會自己新增 選擇位子 -->    



                    </ul>

                    <p>Tickets: <span id="counter">0</span></p>
                    <p>Total: <b>$<span id="total">0</span></b></p>
                    <br>
                    <button class="checkout-button">BUY</button>

                    <div id="legend" class="seatCharts-legend">
                        <ul class="seatCharts-legendList">

                            <li class="seatCharts-legendItem">
                                <!--
                                <div class="seatCharts-seat seatCharts-cell available">
    
                                </div>
                                <span class="seatCharts-legendDescription">Option</span>
                                -->
                            </li>

                            <li class="seatCharts-legendItem">

                                <!-- 
                                <div class="seatCharts-seat seatCharts-cell unavailable"></div>
                                 <span class="seatCharts-legendDescription">Sold</span>
                                -->
                            </li>

                        </ul>
                    </div>


                </div>
                <div style="clear:both"></div>
            </div>

            <script type="text/javascript">

                var price = 10; //price

                $(document).ready(function () {
                    var $cart = $('#selected-seats'), //Sitting Area
                            $counter = $('#counter'), //Votes
                            $total = $('#total'); //Total money

                    var sc = $('#seat-map').seatCharts({
                        map: [//Seating chart
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aaaaaaaaaa',
                            'aa__aa__aa'
                        ],
                        naming: {
                            top: false,
                            getLabel: function (character, row, column) {
                                return column;
                            }
                        },
                        legend: {//Definition legend
                            node: $('#legend'),
                            items: [
                                ['a', 'available', 'Option'],
                                ['a', 'unavailable', 'Sold']
                            ]
                        },
                        click: function () { //Click event
                            if (this.status() == 'available') { //optional seat
                                $('<li>R' + (this.settings.row + 1) + ' S' + this.settings.label + '</li>')
                                        .attr('id', 'cart-item-' + this.settings.id)
                                        .data('seatId', this.settings.id)
                                        .appendTo($cart);

                                $counter.text(sc.find('selected').length + 1);
                                $total.text(recalculateTotal(sc) + price);

                                return 'selected';
                            } else if (this.status() == 'selected') { //Checked
                                //Update Number
                                $counter.text(sc.find('selected').length - 1);
                                //update totalnum
                                $total.text(recalculateTotal(sc) - price);

                                //Delete reservation
                                $('#cart-item-' + this.settings.id).remove();
                                //optional
                                return 'available';
                            } else if (this.status() == 'unavailable') { //sold
                                return 'unavailable';
                            } else {
                                return this.style();
                            }
                        }
                    });
                    //sold seat
                    sc.get(['1-1', '1_2', '4_4', '4_5', '6_6', '6_7', '8_5', '8_6', '8_7', '8_8', '10_1', '10_2', '10_3']).status('unavailable');

                });

                //sum total money
                function recalculateTotal(sc) {
                    var total = 0;
                    sc.find('selected').each(function () {
                        total += price;
                    });

                    return total;
                }
            </script>
        </div>
        <!--footer-->
        <div class="footer">
            <!-- <h1 class="theme-name"><strong>Goocode.net</strong><span>© 2013 - 2015 GOOCODE</span></h1> -->
        </div>




        <script type="text/javascript">
            /* <![CDATA[ */
            (function () {
                try {
                    var s, a, i, j, r, c, l = document.getElementsByTagName("a"), t = document.createElement("textarea");
                    for (i = 0; l.length - i; i++) {
                        try {
                            a = l[i].getAttribute("href");
                            if (a && a.indexOf("/cdn-cgi/l/email-protection") > -1 && (a.length > 28)) {
                                s = '';
                                j = 27 + 1 + a.indexOf("/cdn-cgi/l/email-protection");
                                if (a.length > j) {
                                    r = parseInt(a.substr(j, 2), 16);
                                    for (j += 2; a.length > j && a.substr(j, 1) != 'X'; j += 2) {
                                        c = parseInt(a.substr(j, 2), 16) ^ r;
                                        s += String.fromCharCode(c);
                                    }
                                    j += 1;
                                    s += a.substr(j, a.length - j);
                                }
                                t.innerHTML = s.replace(/</g, "&lt;").replace(/>/g, "&gt;");
                                l[i].setAttribute("href", "mailto:" + t.value);
                            }
                        } catch (e) {
                        }
                    }
                } catch (e) {
                }
            })();
            /* ]]> */
        </script>

    </body>
</html>