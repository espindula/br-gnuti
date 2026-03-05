
use strict;
use warnings;

my %translations = (
  'pt_BR' => {
        'error@arrow{}' => {'' => 'error@arrow{}'},
        'Next' => {'NodeNext direction string' => 'Próximo'},
        ' &nbsp; ' => {'' => ' &nbsp; '},
        'Table of contents' => {'Contents direction description' => 'Sumário'},
        'Contents' => {'Contents direction string' => 'Conteúdo'},
        'Index' => {'Index direction description' => 'Índice'},
        'Index' => {'Index direction string' => 'Índice'},
        ' ? ' => {'' => ' ? '},
        '{number} {section_title}' => {'' => '{number} {section_title}'},
        'Appendix {number} {section_title}' => {'' => 'Anexo {number} {section_title}'},
        'Short Table of Contents' => {'shortcontents section heading' => 'Sumaríssimo'},
        'Table of Contents' => {'contents section heading' => 'Sumário'},
        '{element_text} ({title})' => {'' => '{element_text} ({title})'},
        'Previous' => {'NodePrev direction string' => 'Anterior'},
        'Up' => {'NodeUp direction string' => 'Acima'},
        'see {reference_name}' => {'' => 'veja-se {reference_name}'},
        'See {reference_name}' => {'' => 'Veja-se {reference_name}'},
        '{reference} in @cite{{book}}' => {'' => '{reference} em @cite{{book}}'},
        'see @cite{{book_reference}}' => {'' => 'veja-se @cite{{book_reference}}'},
        'see {reference} in @cite{{book}}' => {'' => 'veja-se {reference} em @cite{{book}}'},
        '{reference_name}' => {'' => '{reference_name}'},
        'See @cite{{book_reference}}' => {'' => 'Veja-se @cite{{book_reference}}'},
        'See {reference} in @cite{{book}}' => {'' => 'Veja-se {reference} em @cite{{book}}'},
        'Footnotes' => {'footnotes section heading' => 'Notas de Rodapé'},
        '{explained_string} ({explanation})' => {'' => '{explained_string} ({explanation})'},
        '@b{{quotation_arg}:} ' => {'' => '@b{{quotation_arg}:} '},
        '@center --- @emph{{author}}' => {'' => '@center --- @emph{{author}}'},
        '{category}: ' => {'' => '{category}: '},
        '{category} of @code{{class}}: ' => {'' => '{category} da @code{{class}}: '},
        '@cite{{book_reference}}' => {'' => '@cite{{book_reference}}'},
        'Jump to' => {'' => 'Pular para'},
        'The node you are looking for is at {href}.' => {'' => 'O nó que você está procurando está em {href}.'},
        'Index' => {'Index direction description' => 'Índice'},
        'Function' => {'category of functions for @defun' => 'Função'},
        'Special Form' => {'' => 'Forma Especial'},
        'Instance Variable' => {'category of instance variables in object-oriented programming for @defivar' => 'Variável de Instância'},
        'Instance Variable' => {'category of instance variables with data type in object-oriented programming for @deftypeivar' => 'Variável de Instância'},
   },
);

my $seen_translated = {};
my $translated_lang = 'pt_BR';

sub my_format_translate_message($$$;$) {   
  my ($converter, $string, $lang, $translation_context) = @_;

  $translation_context = '' if (!defined($translation_context));

  # uncomment next lines to have the strings to translate being printed
  #if (!exists($seen_translated->{"$string-$translation_context"})) {
  #  if (!exists($translations{$translated_lang})
  #      or !exists($translations{$translated_lang}->{$string})
  #      or !exists($translations{$translated_lang}->{$string}
  #                                        ->{$translation_context})) {
  #    print STDERR "       # '$string' => {'$translation_context' => ''},\n";
  #  }
  #  $seen_translated->{"$string-$translation_context"} = 1;
  #}

  return $string if (!defined($lang) or $lang eq '');
  if (exists($translations{$lang})
      and exists($translations{$lang}->{$string})
      and exists($translations{$lang}->{$string}->{$translation_context})) {
    my $translation = $translations{$lang}->{$string}->{$translation_context};
    return $translation;
  }
  return undef;
}

texinfo_register_formatting_function('format_translate_message',
                                          \&my_format_translate_message);

sub my_reset_seen_translated {
  $seen_translated = {};

  return 0;
}

texinfo_register_handler('setup', \&my_reset_seen_translated);

1;
