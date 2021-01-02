function add_to_cart(elem)
{
    var name = elem.childNodes[1];
    var price = elem.childNodes[3];
    //elem.onclick = null
    var table = document.getElementById("table2");
    var tr = document.createElement("tr");
    tr.innerHTML = '<td>' + name.innerHTML +' </td>' + '<td>' + price.innerHTML + '</td>';
    table.appendChild(tr);
}