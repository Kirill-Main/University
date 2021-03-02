function add_to_table()
{
    var name = document.getElementById("name").value;
    var price = document.getElementById("price").value;
    if (!price || !name) return;
    document.getElementById("name").value = "";
    document.getElementById("price").value = "";

    var table = document.getElementById("table");
    var tr = document.createElement("tr");
    tr.innerHTML = '<td>' + name +' </td>' + '<td class="price" onmouseover="this.style.background = ' + "'green'" +'"'+  
    'onmouseout="this.style.background = ' + "'white'" +'">' + price + '</td>';
    table.appendChild(tr);
}

function sum()
{
    var prices = document.getElementsByClassName("price");
    var result = 0;
    Array.prototype.forEach.call(prices, function(el) {
        result += Number.parseInt(el.innerHTML);
    });
    
    var h4 = document.getElementById("result_price");
    h4.innerHTML = 'Итоговая цена: ' + result + ' руб.';
}