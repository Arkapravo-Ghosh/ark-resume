\ProvidesClass{resume}
\LoadClass[10pt,letterpaper]{article}
\usepackage[parfill]{parskip}
\usepackage{array}
\usepackage{ifthen}
\usepackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=blue,
  filecolor=magenta,
  urlcolor=blue,
}
\pagestyle{empty}
\def \name#1{\def\@name{#1}}
\def \@name {}
\def \addressSep {$\diamond$}
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \@ifundefined{@addressthree}{
      \def \@addressthree {#1}
    }{
      \def \@addressone {#1}
    }}
}
\def \printaddress #1{
\begingroup
\def \\ {\addressSep\ }
\centerline{#1}
\endgroup
\par
\addressskip
}
\def \printname {
  \begingroup
  \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
  \nameskip\break
  \endgroup
}
\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{
    \printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{
    \printaddress{\@addressthree}}
}
\newenvironment{rSection}[1]{
  \sectionskip
  \MakeUppercase{{\bf #1}}
  \sectionlineskip
  \hrule
  \begin{list}{}{
      \setlength{\leftmargin}{0em}
    }
    \item[]
          }{
  \end{list}
}
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}{
  \begin{olditemize}
    \setlength{\itemsep}{0em}
    \setlength{\parskip}{0.1em}
    \setlength{\parsep}{0.1em}
    \setlength{\baselineskip}{1.02em}
    }{
  \end{olditemize}
}
\newenvironment{rSubsection}[4]{
{\bf #1} \hfill {#2}
\ifthenelse{\equal{#3}{}}{}{
\\
{\em #3} \hfill {\em #4}
}\smallskip
\begin{list}{$\cdot$}{\leftmargin=0em}
  \itemsep 0em \vspace{0em}
  }{
\end{list}
}
\def\namesize{\LARGE}
\def\addressskip{\smallskip}
\def\sectionlineskip{\medskip}
\def\nameskip{\medskip}
\def\sectionskip{\medskip}
