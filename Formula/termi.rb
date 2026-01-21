class Termi < Formula
  include Language::Python::Virtualenv

  desc "Natural language terminal command executor using LLM APIs"
  homepage "https://github.com/archit0/homebrew-termi"
  url "https://github.com/archit0/homebrew-termi/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "bef76f5685aab16e22388418f661cb7fc3e0a5df1b5c431566b6d3dd788a444e"
  license "MIT"

  depends_on "python@3.12"

  resource "requests" do
    url "https://files.pythonhosted.org/packages/c9/74/b3ff8e6c8446842c3f5c837e9c3dfcfe2018ea6ecef224c710c85ef728f4/requests-2.32.5.tar.gz"
    sha256 "bef76f5685aab16e22388418f661cb7fc3e0a5df1b5c431566b6d3dd788a444e"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062/charset_normalizer-3.4.4.tar.gz"
    sha256 "bef76f5685aab16e22388418f661cb7fc3e0a5df1b5c431566b6d3dd788a444e"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60/idna-3.11.tar.gz"
    sha256 "bef76f5685aab16e22388418f661cb7fc3e0a5df1b5c431566b6d3dd788a444e"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3/urllib3-2.6.3.tar.gz"
    sha256 "bef76f5685aab16e22388418f661cb7fc3e0a5df1b5c431566b6d3dd788a444e"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/e0/2d/a891ca51311197f6ad14a7ef42e2399f36cf2f9bd44752b3dc4eab60fdc5/certifi-2026.1.4.tar.gz"
    sha256 "bef76f5685aab16e22388418f661cb7fc3e0a5df1b5c431566b6d3dd788a444e"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources

    # Install the termi script with correct shebang
    (libexec/"bin").install "termi"

    # Create wrapper script that uses the virtualenv
    (bin/"termi").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python" "#{libexec}/bin/termi" "$@"
    EOS
  end

  test do
    assert_match "Termi", shell_output("#{bin}/termi --help 2>&1", 1)
  end
end
