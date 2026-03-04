

Jaboatão dos Guararapes, Pernambuco Brasil, terça-feira, 03 de março de 2026.


 = = = = = = = = = =
 = = = = = = = = = =


Assunto: arquivos PO e POT


 = = = = = = = = = =
 = = = = = = = = = =

Executar o programa "po4a" sobre um arquivo Portable Object (PO) já traduzido desajustará algumas linhas desse arquivo. Pelo menos foi o que aconteceu no caso do arquivo 'texinfo.texi', o arquivo fonte para se gerar o manual do sistema de documentação GNU Texinfo.

Por esse motivo, é conveniente, oportuno e desejável trabalhar o arquivo PO _fora_ do diretório do projeto de gettextização (o diretório "po4a"). Na data de hoje, os arquivos "pod2texi.texi.pt_BR.po" e "texinfo.texi.pt_BR.po", os arquivos fontes gettextizados para se traduzir o mencionado manual para o idioma português conforme escrito e falado no Brasil, foram _renomeados_ para _fora_ do diretório do projeto de gettextização (o diretório "po4a").

