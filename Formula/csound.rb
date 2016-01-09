require 'formula'
class Csound < Formula
    homepage 'http://csound.github.io'
    head 'https://github.com/ryutaroikeda/csound/csound.git', :branch => 'develop'
    version '6.05.0'

  depends_on 'cmake' => :build
  depends_on 'swig' => :build

  depends_on 'libsndfile'

  depends_on 'portaudio' => :recommended
  depends_on 'portmidi' => :recommended
  depends_on 'liblo' => :recommended
  depends_on 'boost' => :recommended
  depends_on 'libpng' => :recommended
  depends_on 'stk' => :optional
  depends_on 'fltk' => :recommended
  depends_on 'eigen' => :recommended

  option :universal

  def install
    if build.with? "stk"
      system "cmake", ".", "-DUSE_GETTEXT=0", "-DBUILD_STK_OPCODES=1", *std_cmake_args
    else
      system "cmake", ".", "-DUSE_GETTEXT=0", "-DBUILD_STK_OPCODES=0", *std_cmake_args
    end
    system "make", "install"
  end

  test do
    system "csound"
  end
end
