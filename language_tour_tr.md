Bu sayfa Dart dilinin özelliklerinin, değişkenlerden (variables) işlem sembollerine (operators), sınıflardan (classes) kütüphanelere (libraries) kadar bir çoğunu nasıl kullanacağınızı, konuları başka yazılım dillerinden bildiğinizi varsayarak gösterecektir.
Detaylı anlatımlar yerine özet sevenler, [temel örneklere](/samples) göz atabilirler.

Dart dilinin ana kütüphaneleri hakkında daha fazla bilgi için [kütüphane turu](/guides/libraries/library-tour)'na göz atabilirsiniz. Çok daha detaylı bir şekilde Dart dili hakkında bilgi edinmek için de; Dart Dili Beyannamesi(/guides/language/spec)'ni inceleyebilirsiniz.

{{site.alert.note}}
    [DartPad](https://dartpad.dev/) kullanarak, Dart dilinin temel birçok özelliğini online olarak test edebilirsiniz. [DartPad hakkında detaylı bilgi](/tools/dartpad).
    Bu sayfada da canlı örneklerin gösterilmesi için DartPad kullanılmıştır. Canlı örneklerin olması gereken yerlerde boş bölümler görüyorsanız, [DartPad sorunlarının çözümleri](/tools/dartpad/troubleshoot)ne göz atabilrsiniz.
{{site.alert.end}}

{% comment %}
    [TODO #2950: Look for null, ?, !, late, optional, Map, List, Set.
    (Anything else?)
    Look for dynamic. Look for code that isn't auto-included (no code-excerpt.)]
{% endcomment %}

## Basit Bir Dart Uygulaması

Aşağıdaki kodlar Dart dilinin temel özellikleri hakkında bir çok bilgi içermektedir.

<?code-excerpt "../null_safety_examples/misc/test/language_tour/basic_test.dart"?>
```dart
// İşlem (Fonksiyon) tanımlama.
void sayiYazdir(int sayi) {
  print('Sayı $sayi.'); // sayıyı konsola yazdırır.
}

// Burası uygulamanın çalışmaya başlayacağı yerdir.
void main() {
  var sayi = 42; // değişken tanımlama ve değer atamak.
  sayiYazdir(sayi); // tanımlanan işlemi çağırmak.
}
```

Şimdi yukarda kullanılan ve neredeyse tüm Dart uygulamalarında kullanılan terimlerin açıklamasına geçelim;

<code>// <em>Bu tek satırlık bir yorumdur.</em> </code>
:   Tek satırlık yorum.
    Dart dili aynı zamanda çok satırlı ve belgelendirme şeklindeki yorumları da desteklemektedir. [Detaylar için](#comments)

`void`
:   A special type that indicates a value that's never used.
    Functions like `printInteger()` and `main()` that don't explicitly return a value
    have the `void` return type.
    
`int`
:   Another type, indicating an integer.
    Some additional [built-in types](#built-in-types)
    are `String`, `List`, and `bool`.

`42`
:   A number literal. Number literals are a kind of compile-time constant.

`print()`
:   A handy way to display output.

`'...'` (or `"..."`)
:   A string literal.

<code>$<em>variableName</em></code> (or <code>${<em>expression</em>}</code>)
:   String interpolation: including a variable or expression’s string
    equivalent inside of a string literal. For more information, see
    [Strings](#strings).

`main()`
:   The special, *required*, top-level function where app execution
    starts. For more information, see
    [The main() function](#the-main-function).

`var`
:   A way to declare a variable without specifying its type.
    The type of this variable (`int`)
    is determined by its initial value (`42`).


{{site.alert.note}}
  This site's code follows the conventions in the
  [Dart style guide](/guides/language/effective-dart/style).
{{site.alert.end}}
