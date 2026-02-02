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
\RequirePackage{etoolbox}	%	for if-then statements
\RequirePackage{multicol}
\RequirePackage{sectsty}
\RequirePackage{fullpage}
\RequirePackage{titlesec}
\RequirePackage{tabularx}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{hyperref}
\RequirePackage[utf8]{inputenc}

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
	\defbibfilter{invitedpresentation}{type=unpublished and not subtype=nopeer and not subtype=peer}

	\defbibcheck{published}{%
		\iffieldundef{pubstate}{}{\skipentry}}

	\defbibcheck{unpublished}{%
		\iffieldundef{pubstate}{\skipentry}{}}

    \NewBibliographyString{inrevision}
	\DefineBibliographyStrings{english}{inrevision = {in revision}}
	\NewBibliographyString{inreview}
	\DefineBibliographyStrings{english}{inreview = {in review}}
	\NewBibliographyString{accepted}
	\DefineBibliographyStrings{english}{accepted = {accepted}}


% set up hyperref printing
\hypersetup{colorlinks = true, linkcolor = black, anchorcolor = black,
			citecolor = black, urlcolor=black, bookmarksopen = true,
			bookmarksnumbered = true, bookmarksopenlevel = 2, pdfstartview = {FitH},
			pdfborder = {0 0 0}
	}

% some printing params

\setlength{\parindent}{0pt}
\titlespacing*{\section}{0pt}{2ex}{0.5ex}
\titlespacing*{\subsection}{0pt}{2ex}{0.5ex}
\titlespacing*{\subsubsection}{0pt}{2ex}{0.5ex}


% Declare the options
\DeclareStringOption[--]{labelitemi}[--]
% \DeclareDefaultOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*


% % Apply the options
\renewcommand{\labelitemi}{\acv@labelitemi}	%	sets a new list delimiter - a star
\newcommand{\HRule}{\rule{\linewidth}{0.2mm}}


% Customize evironments/section heads, mostly to be lower profile.
\sectionfont{\large}
\setcounter{secnumdepth}{0}
\renewcommand{\section}{%
	\@startsection {section}{1}{\z@}%
	{-2.5ex \@plus -0ex \@minus -.2ex}%
	{0.5ex \@plus 0.1ex \@minus 0ex}%
	{\bfseries\large\selectfont}%
}

\renewcommand{\subsection}{%
	\@startsection
	{subsection}{1}{\z@}{0.2\baselineskip}%
	{0.1\baselineskip}%
	{\bfseries\fontshape{it}\selectfont\raggedright}%
}

\renewcommand{\subsubsection}{%
	\@startsection
	{subsubsection}{1}{\z@}{0.2\baselineskip}%
	{0.1\baselineskip}%
	{\fontshape{it}\selectfont\raggedright}%
}


%% set up the columns for sections throughout the cv
\newcolumntype{E}{>{\raggedright\arraybackslash\hsize=1.675\hsize}X}
\newcolumntype{D}{>{\small\raggedleft\arraybackslash\hsize=.325\hsize}X}
\newcolumntype{d}{>{\small\raggedright\arraybackslash\hsize=.325\hsize}X}
\newcolumntype{I}{>{\small\raggedleft\arraybackslash\hsize=1.00\hsize}X}

\newcolumntype{e}{>{\raggedright\arraybackslash\hsize=1.25\hsize}X}
\newcolumntype{i}{>{\small\raggedleft\arraybackslash\hsize=1.425\hsize}X}

\newcolumntype{s}{>{\small\raggedright\arraybackslash\hsize=0.25\hsize}X}
\newcolumntype{w}{>{\raggedright\arraybackslash\hsize=2.4\hsize}X}
\newcolumntype{n}{>{\small\raggedleft\arraybackslash\hsize=0\hsize}X}

\newcolumntype{a}{>{\small\raggedright\arraybackslash\hsize=0.16\hsize}X}
\newcolumntype{b}{>{\small\raggedright\arraybackslash\hsize=0.0\hsize}X}
\newcolumntype{c}{>{\small\raggedright\arraybackslash\hsize=0.85\hsize}X}

\newcolumntype{q}{>{\small\raggedright\arraybackslash\hsize=1.3375\hsize}X}

\newcolumntype{k}{>{\raggedright\arraybackslash\hsize=0.3\hsize}X}
\newcolumntype{K}{>{\raggedright\arraybackslash\hsize=1.467\hsize}X}

\newcolumntype{y}{>{\small\raggedright\arraybackslash\hsize=.15\hsize}X}
\newcolumntype{f}{>{\raggedright\arraybackslash\hsize=1.617\hsize}X}


% the main package environment is th experience list
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


% a simple listing with year of activity first activity
\NewDocumentEnvironment{yearlist}{O{y f} g}{
	\NewDocumentCommand{\yearitem}{m m}{%
		##1 & ##2 \\[0.3\baselineskip]
	}

	\tabularx{\textwidth}{@{} #1}%
}{%
	\endtabularx%
}


% simple listing of skills
\NewDocumentEnvironment{skilllist}{O{k K} g}{
	\NewDocumentCommand{\skillset}{m m}{%
		##1: & ##2 \\[0.3\baselineskip]
	}

	\tabularx{\textwidth}{@{} #1}%
}{%
	\endtabularx%
}


\endinput



