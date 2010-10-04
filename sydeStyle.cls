% Systems Design Engineering Report Style
%
% Created by Matthew Zulak <mzulak@engmail> with assistance from
% Prof. G. Heppler <heppler@uwaterloo.ca>.
%
% Updated by Darcy Parks <dparks@engmail>
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sydeStyle}
\LoadClass[12pt]{report}  

\usepackage{textcase}
\usepackage{setspace}
\usepackage{scalefnt}
\usepackage{url}
\usepackage{graphicx}
\usepackage{lscape}

\newcommand{\degree}{\ensuremath{^\circ}}

\newif\if@workreport \@workreportfalse
\DeclareOption{workreport}{\@workreporttrue}
\ProcessOptions\relax

% Define new variables
\newcommand{\@authortwo} {}
\newcommand{\authortwo}[1]{
	\renewcommand{\@authortwo}{#1}
}
\newcommand{\@authorthree} {}
\newcommand{\authorthree}[1]{
	\renewcommand{\@authorthree}{#1}
}
\newcommand{\@authorfour} {}
\newcommand{\authorfour}[1]{
	\renewcommand{\@authorfour}{#1}
}
\newcommand{\@authorfive} {}
\newcommand{\authorfive}[1]{
	\renewcommand{\@authorfive}{#1}
}
\newcommand{\@authorsix} {}
\newcommand{\authorsix}[1]{
	\renewcommand{\@authorsix}{#1}
}
\newcommand{\@coursecode} {}
\newcommand{\coursecode}[1]{
	\renewcommand{\@coursecode}{#1}
}
\newcommand{\@prof} {}
\newcommand{\prof}[1]{
	\renewcommand{\@prof}{#1}
}
\newcommand{\@company} {}
\newcommand{\company}[1]{
	\renewcommand{\@company}{#1}
}
\newcommand{\@companyaddress} {}
\newcommand{\companyaddress}[1]{
	\renewcommand{\@companyaddress}{#1}
}


\renewcommand{\chaptername}{}
\renewcommand{\baselinestretch}{1.5}
\renewcommand{\textfraction}{0.01}
\renewcommand{\topfraction}{0.99}
\renewcommand{\bottomfraction}{0.99}
\setlength{\oddsidemargin}{0.5in}
\setlength{\evensidemargin}{0.0in}
\setlength{\textwidth}{6in}
\setlength{\topmargin}{0in}
\setlength{\headheight}{0in}
\setlength{\headsep}{0in}
\setlength{\textheight}{9in}

\newcounter{figs}
\newcounter{eqns}
\newcounter{tabs}
\setcounter{secnumdepth}{1}

\bibliographystyle{IEEEtran}
  
% TODO
% 1. Fix the width of the title so the line breaks sooner
% 2. Allow multiple authors somehow
% 3. Make the vertical spacing look like the example.
% 4. Figure out mandatory/optional arguments for each type of report
% 5. Fix typeout messages

\newcommand{\worktitlepage}
{
	\renewcommand{\maketitle}
	{
		\begin{titlepage}
			\vspace*{2em}
			\begin{center}
				University of Waterloo\\
				Faculty of Engineering\\
				Department of Systems Design Engineering
			\end{center}
			\null\vfill

			\begin{center}
				\Huge\@title
			\end{center}
			\null\vfill

			\begin{center}
				\@company\\
				\@companyaddress
			\end{center}
			\vspace{2em}

			\begin{center}
				\@author\\
				\@date.
			\end{center}
		\end{titlepage}
	}
}

\newcommand{\designtitlepage}
{
	\renewcommand{\maketitle}
	{
		\begin{titlepage}
		\vspace*{2em}
		\begin{center}
			{\Huge\@title}
		\end{center}
		\null\vfill
	
		\begin{center}
			{A Report Submitted in Partial Fulfillment\\
			of the Requirements for SYDE \@coursecode}
		\end{center}
		\vspace{2em}
	
		\begin{center}
			\@author\par
			\@authortwo\par
			\@authorthree\par
			\@authorfour\par
		\end{center}
		\vskip 2em
	
		\begin{center}
			{Faculty of Engineering\\
			Department of Systems Design Engineering}
		\end{center}
		\vskip 2em
	
		\begin{center}
			{\@date.\\
			Course Instructor: \@prof}
		\end{center}
	\end{titlepage}
	}
}

\if@workreport
	\worktitlepage
	\typeout{SYDE: Creating work report}
\else
	\designtitlepage
	\typeout{SYDE: Creating design report}
\fi
