%% cv.cls
%% last modified on 12/19/2021

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2021/12/19 CV LaTeX class]
\LoadClass[letterpaper,11pt]{article}

\RequirePackage[margin=1in]{geometry}
\RequirePackage[colorlinks=true,allcolors=blue]{hyperref}
\RequirePackage{titlesec}  % customize the section headings
\RequirePackage{tabularx}
\RequirePackage{ltablex}
\RequirePackage[strict]{changepage}
\RequirePackage{unicode-math}
\RequirePackage{fontspec}
\RequirePackage[
  backend=biber,
  style=numeric,
  sorting=ydnt,
  defernumbers=true,
  style=phys,
  biblabel=brackets,
  pageranges=false,
]{biblatex}

\setmathfont[Scale=1]{STIXTwoMath-Regular}
\setmainfont[
  UprightFont={*-Regular},
  BoldFont={*-Bold},
  ItalicFont={*-Italic},
  BoldItalicFont={*-BoldItalic},
  Ligatures=TeX
]{STIXTwoText}

% custom formatting for section titles
\titleformat{\section}{\normalfont\bfseries}{\thesection}{1em}{\MakeUppercase}
% changes row height of tables
\renewcommand{\arraystretch}{1.4}

\setlength{\parindent}{0in}

% Reverse bibliography numbering. Taken from stackexchange.
% Count total number of entries in each refsection
\AtDataInput{%
  \csnumgdef{entrycount:\therefsection}{%
    \csuse{entrycount:\therefsection}+1}}

% Print the labelnumber as the total number of entries in the
% current refsection, minus the actual labelnumber, plus one
\DeclareFieldFormat{labelnumber}{\mkbibdesc{#1}}    
\newrobustcmd*{\mkbibdesc}[1]{%
  \number\numexpr\csuse{entrycount:\therefsection}+1-#1\relax}

\defbibenvironment{bibliography}
  {\list
     {\printtext[labelnumberwidth]{%
        \printfield{prefixnumber}
        \printfield{labelnumber}}}
     {% add indentation to citations
      \setlength{\labelwidth}{\dimexpr\labelnumberwidth+0.5in}
      \setlength{\leftmargin}{\labelwidth}
      \setlength{\labelsep}{\biblabelsep}
      \addtolength{\leftmargin}{\labelsep}
      \setlength{\itemsep}{\bibitemsep}
      \setlength{\parsep}{\bibparsep}}
      \renewcommand*{\makelabel}[1]{\hss##1}}
  {\endlist}
  {\item}
