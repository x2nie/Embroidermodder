#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Embroidermodder 2 documentation build configuration file, created by
# sphinx-quickstart on Sun May 11 02:34:28 2014.
#
# This file is execfile()d with the current directory set to its
# containing dir.
#
# Note that not all possible configuration values are present in this
# autogenerated file.
#
# All configuration values have a default; values that are commented out
# serve to show the default.

import os
import sys

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
sys.path.append(os.path.abspath('.'))
sys.path.append('..')
sys.path.insert(0, os.path.abspath('..'))

# -- General configuration ------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
## needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.todo',          # http://sphinx-doc.org/ext/todo.html
    'sphinx.ext.autodoc',       # http://sphinx-doc.org/ext/autodoc.html
    'sphinx.ext.autosummary',   # http://sphinx-doc.org/ext/autosummary.html
    'sphinx.ext.coverage',      # http://sphinx-doc.org/ext/coverage.html

    'sphinx.ext.doctest',       # http://sphinx-doc.org/ext/doctest.html
    'sphinx.ext.intersphinx',   # http://sphinx-doc.org/ext/intersphinx.html
    'sphinx.ext.pngmath',       # http://sphinx-doc.org/ext/math.html#module-sphinx.ext.pngmath
    ## 'sphinx.ext.mathjax',       # http://sphinx-doc.org/ext/math.html#module-sphinx.ext.mathjax
    ## 'sphinx.ext.jsmath',        # http://sphinx-doc.org/ext/math.html#module-sphinx.ext.jsmath
    'sphinx.ext.ifconfig',      # http://sphinx-doc.org/ext/ifconfig.html
    'sphinx.ext.extlinks',      # http://sphinx-doc.org/ext/extlinks.html
    'sphinx.ext.viewcode',      # http://sphinx-doc.org/ext/viewcode.html
    ## 'sphinx.ext.linkcode',      # http://sphinx-doc.org/ext/linkcode.html
    ## 'sphinx.ext.napoleon',      # http://sphinx-doc.org/ext/napoleon.html

    ## 'sphinx.ext.inheritance_diagram',  # http://sphinx-doc.org/ext/inheritance.html
    ## 'sphinx.ext.graphviz',      # http://sphinx-doc.org/ext/graphviz.html

    ## 'sphinx.ext.oldcmarkup',    # http://sphinx-doc.org/ext/oldcmarkup.html

    'availability'
    ]

todo_include_todos = True
todo_all_todos = True

availability_include_availabilities = True
availability_all_availabilities = True

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix of source filenames.
source_suffix = '.txt'

# The encoding of source files.
## source_encoding = 'utf-8-sig'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = u'Embroidermodder 2'
copyright = u'2014, Embroidermodder 2 Team'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = '2.0.0'
# The full version, including alpha/beta/rc tags.
release = '2.0.0'

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
## language = None

# There are two options for replacing |today|: either, you set today to some
# non-false value, then it is used:
#today = ''
# Else, today_fmt is used as the format for a strftime call.
today_fmt = '%B %d, %Y'

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
exclude_patterns = ['_build', '_ignore']

# The reST default role (used for this markup: `text`) to use for all
# documents.
## default_role = None
## default_role = 'autolink'

# If true, '()' will be appended to :func: etc. cross-reference text.
add_function_parentheses = False

# If true, the current module name will be prepended to all description
# unit titles (such as .. function::).
add_module_names = False

# If true, sectionauthor and moduleauthor directives will be shown in the
# output. They are ignored by default.
show_authors = True

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# A list of ignored prefixes for module index sorting.
## modindex_common_prefix = []

# If true, keep warnings as "system message" paragraphs in the built documents.
keep_warnings = True

# If true, Sphinx will warn about all references where the target cannot be found.
# Default is False. You can activate this mode temporarily using the -n command-line switch.
nitpicky = False

# A list of (type, target) tuples (by default empty) that should be ignored when generating warnings in "nitpicky mode".
# Note that type should include the domain name if present.
# Example entries would be ('py:func', 'int') or ('envvar', 'LD_LIBRARY_PATH').
nitpick_ignore = []

# The default language to highlight source code in. The default is 'python'.
# The value should be a valid Pygments lexer name, see Showing code examples for more details.
highlight_language = 'python'

# A string of reStructuredText that will be included at the end of every source file that is read.
# This is the right place to add substitutions that should be available in every file.
# An example:
# rst_epilog = """
# .. |psf| replace:: Python Software Foundation
# """
## rst_epilog = """
## MyEpilog
## """

# A string of reStructuredText that will be included at the beginning of every source file that is read.
## rst_prolog = """
## MyProlog
## """


# -- Options for HTML output ----------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
## html_theme = 'default'
## html_theme = 'sphinxdoc'
## html_theme = 'agogo'
## html_theme = 'basic'
## html_theme = 'epub'
## html_theme = 'haiku'
## html_theme = 'nature'
## html_theme = 'pyramid'
## html_theme = 'scrolls'
## html_theme = 'traditional'
html_theme = 'embroidertheme'

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
## html_theme_options = {}
html_theme_options = dict()

# Add any paths that contain custom themes here, relative to this directory.
## html_theme_path = []
html_theme_path = ['.']

# The name for this set of Sphinx documents.  If None, it defaults to
# "<project> v<release> documentation".
## html_title = None

# A shorter title for the navigation bar.  Default is the same as html_title.
## html_short_title = None
html_short_title = 'Embroidermodder 2 Docs'

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
## html_logo = None
html_logo = '_static/images/sphinxdocs/logo_embroidermodder_2_0_sidebar.png'

# The name of an image file (within the static path) to use as favicon of the
# docs.  This file should be a Windows icon file (.ico) being 16x16 or 32x32
# pixels large.
## html_favicon = None
html_favicon = '_static/images/sphinxdocs/embroidermodder2.ico'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_style = 'css/embroidermodder.css'

# Add any extra paths that contain custom files (such as robots.txt or
# .htaccess) here, relative to this directory. These files are copied
# directly to the root of the documentation.
## html_extra_path = []

# If not '', a 'Last updated on:' timestamp is inserted at every page bottom,
# using the given strftime format.
## html_last_updated_fmt = '%b %d, %Y'

# If true, SmartyPants will be used to convert quotes and dashes to
# typographically correct entities.
## html_use_smartypants = True

# Custom sidebar templates, maps document names to template names.
## html_sidebars = {}
# html_sidebars = {'index': 'indexsidebar.html'}

# Additional templates that should be rendered to pages, maps page names to
# template names.
## html_additional_pages = {}

# If false, no module index is generated.
## html_domain_indices = True

# If false, no index is generated.
html_use_index = True

# If true, the index is split into individual pages for each letter.
html_split_index = False

# If true, links to the reST sources are added to the pages.
html_show_sourcelink = True

# If true, "Created using Sphinx" is shown in the HTML footer. Default is True.
html_show_sphinx = True

# If true, "(C) Copyright ..." is shown in the HTML footer. Default is True.
html_show_copyright = True

# If true, an OpenSearch description file will be output, and all pages will
# contain a <link> tag referring to it.  The value of this option must be the
# base URL from which the finished HTML is served.
## html_use_opensearch = ''

# This is the file name suffix for HTML files (e.g. ".xhtml").
## html_file_suffix = None

# Output file base name for HTML help builder.
htmlhelp_basename = 'Embroidermodder2doc'

# This value selects what content will be inserted into the main body of an autoclass directive.
# "class"
#     Only the class� docstring is inserted. This is the default.
#     You can still document __init__ as a separate method using automethod or the members option to autoclass.
# "both"
#     Both the class� and the __init__ method�s docstring are concatenated and inserted.
# "init"
#     Only the __init__ method�s docstring is inserted.
autoclass_content = 'class'

# This value selects if automatically documented members
# are sorted alphabetical (value 'alphabetical'),
# by member type (value 'groupwise') or
# by source order (value 'bysource'). The default is alphabetical.
# Note that for source order, the module must be a Python module with the source code available.
autodoc_member_order = 'bysource'

# This value is a list of autodoc directive flags that should be automatically
# applied to all autodoc directives.
# The supported flags are 'members', 'undoc-members', 'private-members',
#                         'special-members', 'inherited-members' and 'show-inheritance'.
# If you set one of these flags in this config value, you can use a negated form,
# 'no-flag', in an autodoc directive, to disable it once.
# For example, if autodoc_default_flags is set to ['members', 'undoc-members'],
# and you write a directive like this:
#
# .. automodule:: foo
#    :no-undoc-members:
#
# the directive will be interpreted as if only :members: was given.
## autodoc_default_flags = []
autodoc_default_flags = ['members', 'undoc-members', 'private-members', 'special-members', 'show-inheritance']  # 'inherited-members',

# Functions imported from C modules cannot be introspected, and therefore the
# signature for such functions cannot be automatically determined.
# However, it is an often-used convention to put the signature into the first line of the function�s docstring.
#
# If this boolean value is set to True (which is the default), autodoc will look at
# the first line of the docstring for functions and methods, and if it looks like
# a signature, use the line as the signature and remove it from the docstring content.
## autodoc_docstring_signature = True

# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
# The paper size ('letterpaper' or 'a4paper').
#'papersize': 'letterpaper',

# The font size ('10pt', '11pt' or '12pt').
#'pointsize': '10pt',

# Additional stuff for the LaTeX preamble.
#'preamble': '',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
  ('index', 'Embroidermodder2.tex', u'Embroidermodder 2 Documentation',
   u'Embroidermodder 2 Team', 'manual'),
]

# The name of an image file (relative to this directory) to place at the top of
# the title page.
## latex_logo = None

# For "manual" documents, if this is true, then toplevel headings are parts,
# not chapters.
## latex_use_parts = False

# If true, show page references after internal links.
## latex_show_pagerefs = False

# If true, show URL addresses after external links.
## latex_show_urls = False

# Documents to append as an appendix to all manuals.
## latex_appendices = []

# If false, no module index is generated.
## latex_domain_indices = True


# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    ('index', 'embroidermodder2', u'Embroidermodder 2 Documentation',
     [u'Embroidermodder 2 Team'], 1)
]

# If true, show URL addresses after external links.
## man_show_urls = False


# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
  ('index', 'Embroidermodder2', u'Embroidermodder 2 Documentation',
   u'Embroidermodder 2 Team', 'Embroidermodder2', 'One line description of project.',
   'Miscellaneous'),
]

# Documents to append as an appendix to all manuals.
## texinfo_appendices = []

# If false, no module index is generated.
## texinfo_domain_indices = True

# How to display URL addresses: 'footnote', 'no', or 'inline'.
## texinfo_show_urls = 'footnote'

# If true, do not generate a @detailmenu in the "Top" node's menu.
## texinfo_no_detailmenu = False


################################################################################

import sys
from os.path import basename
import inspect

try:
    from StringIO import StringIO
except ImportError:
    from io import StringIO

from sphinx.util.compat import Directive
from docutils import nodes, statemachine

# ONLY import the classes we will generate method_summary for.
from .Embroidermodder_PySide_PyQt_GUI import EmbroidermodderMainWindow, MDIArea
from .embdetails_dialog import EmbDetailsDialog
from .mdisubwindow_textedit import MDISubWindow_TextEdit
from .property_editor import PropertyEditor
from .settings_dialog import Settings_Dialog
from .statusbar import StatusBar
from .statusbar_button import StatusBarButton
from .tipoftheday_dialog import LightSwitchWidget, ImageWidget, TipOfTheDayDialog
from .undo_editor import UndoEditor
from .dialog_about import AboutDialog, EmbroidermodderLogo
from .cmdprompt import CmdPrompt, CmdPromptSplitter, CmdPromptHandle, CmdPromptHistory, CmdPromptInput
# ONLY allow valid class names! else you will might like the end result.
AUTHORIZED_ALLOWED_CLASSNAME_EVIL_STRINGS = [
    'EmbroidermodderMainWindow', 'MDIArea',
    'EmbDetailsDialog',
    'MDISubWindow_TextEdit',
    'PropertyEditor',
    'Settings_Dialog',
    'StatusBar',
    'StatusBarButton',
    'LightSwitchWidget', 'ImageWidget', 'TipOfTheDayDialog',
    'UndoEditor',
    'AboutDialog', 'EmbroidermodderLogo',
    'CmdPrompt', 'CmdPromptSplitter', 'CmdPromptHandle', 'CmdPromptHistory', 'CmdPromptInput',
    ]


def _getclass(method):
    try:
        return method.im_class
    except AttributeError:
        return method.__class__


def magicmethod(method):
    method_cls = _getclass(method)
    if method.__name__ not in method_cls.__dict__:
        return 'inherited'
    for cls in method_cls.__mro__[1:]:
        if method.__name__ in cls.__dict__:
            return 'overloaded'
    return 'newly defined'


class SphinxGenerateMethodsSummaryDirective(Directive):
    """
    Execute the specified python code(Should be a valid class name!) and insert the output into the document

    Generate the sphinxified methods_summary table part of a class docstring.

    Example Usage::

        .. sphinx_generate_methods_summary::
           MyClassName

    :TODO: Include/Exclude private/special/Test defs and dev whatnot. We may/maynot want to include that stuff publically.

    """
    has_content = True

    def run(self):
        ## print('self.content = %s' % self.content)
        ## print('self.name = %s' % self.name)
        ## print('self.lineno = %s' % self.lineno)
        ## print('self.content_offset = %s' % self.content_offset)
        ## print('self.block_text = %s' % self.block_text)
        ## print('self.state = %s' % self.state)
        ## print('self.state_machine = %s' % self.state_machine)

        oldStdout, sys.stdout = sys.stdout, StringIO()

        tab_width = self.options.get('tab-width', self.state.document.settings.tab_width)
        source = self.state_machine.input_lines.source(self.lineno - self.state_machine.input_offset - 1)

        try:
            ## import wx
            ## app = wx.App(0)
            Should_I_Allow_Possible_Arbitrary_Code_Execution = '%s' % self.content[0].strip() in AUTHORIZED_ALLOWED_CLASSNAME_EVIL_STRINGS
            ## wx.MessageBox('%s' % Should_I_Allow_Possible_Arbitrary_Code_Execution, 'Should_I_Allow_Possible_Arbitrary_Code_Execution')
            ## wx.MessageBox('%s' % self.content[0].strip(), 'self.content')
            if not Should_I_Allow_Possible_Arbitrary_Code_Execution:
                raise Exception('UNAUTHORIZED ClassName! \n%s' % self.content)

            stripedContent = self.content[0].strip()
            if ' ' in stripedContent:
                raise Exception('UNAUTHORIZED ClassName! \n%s' % self.content)

            className = stripedContent
            class_ = eval(stripedContent)  # Should evaluate to one of the imported Classes
            members = inspect.getmembers(class_, predicate=inspect.ismethod)

            ## newly_defined_methods = []
            ## for methodName, method in members:
            ##     method_type = magicmethod(method)
            ##     if method_type in ('newly defined', 'overloaded') and methodName is not '__init__':
            ##         newly_defined_methods.append(methodName)
            newly_defined_methods = [(':meth:`~' + methodName + '`') for methodName, method in members
                                        if magicmethod(method) in ('newly defined', 'overloaded') and methodName is not '__init__']
            method_names = [methodName for methodName, method in members
                                if magicmethod(method) in ('newly defined', 'overloaded') and methodName is not '__init__']

            methods_summaryStr = ''
            if not newly_defined_methods:
                longest_string = 0  # We have an empty class or one with just __init__
                if not hasattr(class_, '__init__'):
                    return []  # Probably an empty class. Ex: DebugClass(): pass
            else:
                longest_string = len(max(newly_defined_methods, key=len))

            tableTopBottom = '=' * longest_string
            sphinxIndent = ' ' * 2
            methods_summaryStr += ('|methods_summary|:\n\n')
            methods_summaryStr += ('%s%s %s\n' % (sphinxIndent, tableTopBottom, tableTopBottom))
            if hasattr(class_, '__init__'):
                methods_summaryStr += ('%s%s %s\n' % (sphinxIndent, ':meth:`~__init__`'.ljust(longest_string, ' '), 'Default class constructor.'))
            for i, strng in enumerate(newly_defined_methods):
                leftHalf = strng.ljust(longest_string, ' ')

                docStr = inspect.getdoc(eval('%s.%s' % (className, method_names[i])))
                if docStr is None:
                    rightHalf = 'None: Missing Docstring'
                else:
                    docStrReplace = docStr.replace('\r\n', '\n').replace('\r', '\n')
                    if '\n' in docStrReplace:
                        firstLineOfdocStr = '%s' % docStrReplace[0: docStrReplace.find('\n') + 1]
                    else:  # Single liner docstring.
                        firstLineOfdocStr = docStrReplace
                    rightHalf = firstLineOfdocStr

                methods_summaryStr += ('%s%s %s\n' % (sphinxIndent, leftHalf, rightHalf))
            methods_summaryStr += ('%s%s %s\n' % (sphinxIndent, tableTopBottom, tableTopBottom))
            methods_summaryStr += ('\n|%s|\n' % ('_' * 74))

            text = methods_summaryStr
            lines = statemachine.string2lines(text, tab_width, convert_whitespace=True)
            self.state_machine.insert_input(lines, source)
            return []
        except Exception as exc:
            raise exc
            return [nodes.error(None,
                                nodes.paragraph(text="UNAUTHORIZED attempt to execute python code at %s:%d:" % (basename(source), self.lineno)),
                                nodes.paragraph(text=str(sys.exc_info()[1])))]
        finally:
            sys.stdout = oldStdout


def setup(app):
    app.add_directive('sphinx_generate_methods_summary', SphinxGenerateMethodsSummaryDirective)
