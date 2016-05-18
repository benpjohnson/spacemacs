;;; Compiled snippets and support files for `php-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'php-mode
                     '(("pf" "public function $1($2)\n{\n    $3\n}\n" "Public function" nil nil nil "/home/bjohnson/.emacs.d/private/snippets/php-mode/publicfunction" nil nil)
                       ("has" "public function has${1:$$(capitalize-word yas-text)}()\n{\n    return count($this->$1);\n}" "Has Method" nil nil nil "/home/bjohnson/.emacs.d/private/snippets/php-mode/hasmethod" nil nil)
                       ("_c" "public function __construct()\n{\n  $1\n}" "construct" nil nil nil "/home/bjohnson/.emacs.d/private/snippets/php-mode/construct" nil nil)
                       ("opts" "\nfunction help($name)\n{\n    echo <<<EOF\n$name\n\nEOF;\n}\n\n$name = array_shift($argv);\nforeach ($argv as $opt) {\n    switch ($opt) {\n\n    case '--lol':\n        break;\n\n    case '--help':\n        help($name);\n        exit(0);\n\n    default:\n        echo \"Unknown option \\\"$opt\\\"\\n\";\n        exit(1);\n    }\n}" "Command line option parsing" nil nil nil "/home/bjohnson/.emacs.d/private/snippets/php-mode/commandlineoptions" nil nil)
                       ("class" "class $1\n{\n    public function __construct()\n    {\n\n    }\n}" "Class" nil nil nil "/home/bjohnson/.emacs.d/private/snippets/php-mode/class" nil nil)))


;;; Do not edit! File generated at Thu May 12 16:33:44 2016
