require 'formula'

class Gnuplot <Formula
  url 'http://downloads.sourceforge.net/project/gnuplot/gnuplot/4.4.0/gnuplot-4.4.0.tar.gz'
  homepage 'www.gnuplot.info'
  md5 'e708665bd512153ad5c35252fe499059'

  depends_on 'readline'

  depends_on 'aquaterm'
  depends_on 'gd' unless ARGV.include? "--nogd"

  depends_on 'pdflib-lite' if ARGV.include? "--pdf"
  depends_on 'lua' unless ARGV.include? '--nolua'
  depends_on 'gd' unless ARGV.include? "--nogd"

  def options
    [
      ["--pdf", "Build with pdflib-lite support."],
      ["--nolua", "Build without lua support."],
      ["--nogd", "Build without gd support."]
    ]
  end

  def install
    # Help configure find libraries
    ENV.x11

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-readline=#{prefix}",
                          "--disable-wxwidgets"
    system "make install"
  end
end
