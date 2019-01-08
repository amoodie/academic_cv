%	LaTeX Class for making academic oriented CV
%	(c) Andrew Moodie
% 	MIT Licence

% todo
 % put todo in github issues
 % make environments (i.e., replace all the tabularx)
 % separate environment for lists and for biblo? "experience_item?"
 % make it not want to break up sections across a page
 % make all the styling in the sections uniform (i.e., break at Rice University)
 % maybe remove all the location details?
 % header support -- parse only if it exists
 % tight item class like erics (shoult item section be one of the options?)

% Identification
% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academic_cv}[2018/03/05 academic_cv LaTeX class]


% Preliminary declarations
% 
\LoadClass[11pt]{article}
% \RequirePackage{geometry}	%	for margins etc
\RequirePackage{etoolbox}	%	for if-then statements
\RequirePackage{multicol}
\RequirePackage{sectsty}
\RequirePackage{fullpage}
\RequirePackage{titlesec}
\RequirePackage{tabularx}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{hyperref}
\RequirePackage[utf8]{inputenc}
% \usepackage{times}
\RequirePackage{xparse}
\RequirePackage{kvoptions}
	\SetupKeyvalOptions{%
		family=acv,
		prefix=acv@,
		}

% set up the reference handler
\RequirePackage{academic_cv_reflist}
	% define the filters that will separate out the sections printed
	\defbibfilter{peer}{type=article and not subtype=nopeer}
	\defbibfilter{nopeer}{not type=inproceedings and subtype=nopeer}
	\defbibfilter{conf}{type=inproceedings}
	\nocite{*} % add support to turn this off with an option 
			   %(i.e., declare them yourself in your document)

% set up hyperref printing
\hypersetup{colorlinks = true, linkcolor = black, anchorcolor = black,
			citecolor = black, urlcolor=black, bookmarksopen = true,
			bookmarksnumbered = true, bookmarksopenlevel = 2, pdfstartview = {FitH},
			pdfborder = {0 0 0}
	}

% some printing params

\setlength{\parindent}{0pt}
\titlespacing*{\section}{0pt}{2ex}{0.5ex}
% \setlength{\parskip}{0.1cm plus2mm minus1mm} % adds space between paragraphs

% Declare the options
%
% \DeclareVoidOption{null}
\DeclareStringOption[--]{labelitemi}[--]
% \DeclareDefaultOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*


% Define Parameters
% 
			%	prevents automatic numbering for sections
% \definecolor{lgrey}{gray}{0.75}		%	make a light grey color for mnotes



% % Apply the options
% % 
\renewcommand{\labelitemi}{\acv@labelitemi}	%	sets a new list delimiter - a star
\newcommand{\HRule}{\rule{\linewidth}{0.2mm}}
% \iftoggle{@draft}{%
% 	\doublespacing	% make double spaced.
% 	\newcommand{\cnote}[2][citation needed]{\sethlcolor{lgrey} \hl{[#1:#2]}}		% make note for needed citations. 
% 	\newcommand{\pnote}[1]{\sethlcolor{GreenYellow} \textcolor{black}{\hl{[#1]}}}	% make note for personal notes.
% 	\newcommand{\mnote}[2]{\sethlcolor{lgrey} \hl{#1} \todo{#2}}					% make note for margin discussion.
% %		make a custom page size that allows an extra area for margins.
% 	\geometry{%
% 		left = 1in,%
% 		right = 2.5in,%
% 		top = 1in,%
% 		bottom = 1in,%
% 		papersize = {10in, 11in},%
% 		marginparwidth = 2in
% 	}
% 	\linenumbers
% }{%
% %	sets the paper size and standard 1 inch margins. need to add functionality eventually to be able to set margins
% %	and paper size and text size.
% 	\geometry{letterpaper, margin=1in}	
% 	\newcommand{\cnote}[1]{}
% 	\newcommand{\pnote}[1]{}
% 	\newcommand{\mnote}[1]{}
% }

% %	allows an option to disable notes entirely, but preserve draft mode
% \iftoggle{@nonotes}{%
% 	\renewcommand{\cnote}[1]{}
% 	\renewcommand{\pnote}[1]{}
% 	\renewcommand{\mnote}[1]{}
% }{%
% }

% % 	customize title to be lower profile and centered at the top.
% \renewcommand{\maketitle}{%
% 	{%
% 		\centering\fontseries{b}\selectfont%
% 		\@title \\%
% 		\rule[1ex]{\textwidth}{0.5pt}%
% %	This is to try to change the behavior to allow author and date to appear or disappear.
% %			\ifboolexpr{ test {\ifdefempty{\author}} and test {\ifdefempty{\date}} } {
% %				\rule[1ex]{\textwidth}{0.5pt}%
% %			}{
% %				\normalsize\fontseries{m}\selectfont\@author{} --- \@date{} \\%
% %				\rule[1ex]{\textwidth}{0.5pt}%
% %			}
% 	}
% }

% \ifdefstring{\cp@fontspec}{times}{%
% 	\RequirePackage{times}
% }{}


% Customize evironments/section heads, mostly to be lower profile.
%
\sectionfont{\large}
\setcounter{secnumdepth}{0}
\renewcommand{\section}{%
	\@startsection {section}{1}{\z@}%
	{-2.5ex \@plus -1ex \@minus -.2ex}%
	{0.5ex \@plus 0.1ex \@minus 0ex}%
	{\bfseries\large\selectfont}%
}

% \renewcommand{\subsection}{%
% 	\@startsection
% 	{subsection}{1}{\z@}{0.2\baselineskip}%
% 	{0.1\baselineskip}%
% 	{\fontseries{b}\fontshape{it}\selectfont\raggedright}%
% }



\newcolumntype{E}{>{\raggedright\arraybackslash\hsize=1.675\hsize}X}
\newcolumntype{D}{>{\small\raggedleft\arraybackslash\hsize=.325\hsize}X}
\newcolumntype{I}{>{\small\raggedleft\arraybackslash\hsize=1.00\hsize}X}

\newcolumntype{e}{>{\raggedright\arraybackslash\hsize=1.25\hsize}X}
\newcolumntype{i}{>{\small\raggedleft\arraybackslash\hsize=1.425\hsize}X}

\newcolumntype{s}{>{\small\raggedright\arraybackslash\hsize=0.25\hsize}X}
\newcolumntype{w}{>{\raggedright\arraybackslash\hsize=2.4\hsize}X}
\newcolumntype{n}{>{\small\raggedleft\arraybackslash\hsize=0\hsize}X}

\newcolumntype{q}{>{\small\raggedright\arraybackslash\hsize=1.3375\hsize}X}

\newcolumntype{k}{>{\raggedright\arraybackslash\hsize=0.3\hsize}X}
\newcolumntype{K}{>{\raggedright\arraybackslash\hsize=1.467\hsize}X}

\NewDocumentEnvironment{experlist}{O{E I D} g}{%
	
	\NewDocumentCommand{\exper}{s t| m o o m g}{%
		\IfNoValueTF{##4}% if there is no optional arg supplied
			{##3 && ##6\\}% true
			{\IfNoValueTF{##5}% false, if there is anything in 5 
				{##3 & \usesc{##1}{##4} & ##6\\}% true
				{\IfBooleanTF{##2}% false, if flip flag
					{##3 & ##5; \usesc{##1}{##4} & ##6\\}%
					{##3 & \usesc{##1}{##4}; ##5 & ##6\\}% 
				}%
			}%
	}%


	\NewDocumentCommand{\organ}{s m o}{%
		\IfNoValueTF{##3}%
			{##2\\}%
			{##2; \usesc{##1}{##3}\\}%
	}%


	\NewDocumentCommand{\usesc}{m m}{%
		\IfBooleanTF{##1}%
			{{##2}}%
			{\textsc{##2}}%
		}%

	\tabularx{\textwidth}{@{} #1}%
}{%
	\endtabularx%
}


\NewDocumentEnvironment{skilllist}{O{k K} g}{
	\NewDocumentCommand{\skillset}{m m}{%
		##1: & ##2 \\[0.3\baselineskip]
	}

	\tabularx{\textwidth}{@{} #1}%
}{%
	\endtabularx%
}


% \codefrom{a} \quad \codefrom{a}[b] \quad \codefrom{a}[b][c]	

% \newenvironment{tightitemize}{%
% 	\begin{itemize}[noitemsep,nolistsep]
% }{%
% 	\end{itemize}
% }

% \newenvironment{tightenum}{%
% 	\begin{enumerate}[noitemsep,nolistsep]
% }{%
% 	\end{enumerate}
% }

% \newenvironment{tightcenter}{%
%   \setlength\topsep{0pt}
%   \setlength\parskip{0pt}
%   \begin{center}
% }{%
%   \end{center}
% }

% \endinput



