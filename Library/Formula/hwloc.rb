require 'formula'

class Hwloc < Formula
  url 'http://www.open-mpi.org/software/hwloc/v1.2/downloads/hwloc-1.2.tar.gz'
  homepage 'http://www.open-mpi.org/projects/hwloc/'
  md5 'd13ba042360712ccdcad0e5d5a650304'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
