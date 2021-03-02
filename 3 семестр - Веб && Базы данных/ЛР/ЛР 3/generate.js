//Строка, куда сохраняются теги и их данные
var str = '';

// elem - элемент, indent - отступ
function generate(elem, indent, level) 
{
    if (elem != '[object Text]')
        console.log("Начало тега " + elem.tagName + " - " + level + " уровень");
    
    str += indent + (elem=='[object Text]'?elem.data:'&lt;' + elem.tagName + '&gt;') + '<br>';

    if (elem.childNodes.length == 0)
    {
        if (elem != '[object Text]' && elem.tagName != 'BR')
        {
            console.log("Конец тега " + elem.tagName + " - " + level + " уровень");
            str += indent + '&lt;/' + elem.tagName + '&gt;' + '<br>';
        }
        return;
    }
    else 
        for (var i = 0; i < elem.childNodes.length; i++) 
            generate(elem.childNodes[i], indent + '&nbsp;&nbsp;&nbsp;&nbsp;', level + 1);
    
    if (elem != '[object Text]')
    {
        console.log("Конец тега " + elem.tagName + " - " + level + " уровень");
        str += indent + '&lt;/' + elem.tagName + '&gt;' + '<br>';
    }
}
