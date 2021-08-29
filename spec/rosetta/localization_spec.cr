require "../spec_helper"

describe Rosetta do
  after_each do
    reset_to_default_locale
  end

  describe ".localize" do
    it "localizes day and month names" do
      time = Time.local(1815, 12, 10, 10, 18, 15)

      Rosetta.localize("%a %^a %A %^A", time)
        .should eq("Sun SUN Sunday SUNDAY")
      Rosetta.localize("%b %^b %B %^B", time)
        .should eq("Dec DEC December DECEMBER")
      Rosetta.localize("%p %P", time)
        .should eq("AM am")

      Rosetta.locale = "nl"
      time = Time.local(2219, 4, 10, 22, 19, 10)

      Rosetta.localize("%a %^a %A %^A", time)
        .should eq("za ZA zaterdag ZATERDAG")
      Rosetta.localize("%b %^b %B %^B", time)
        .should eq("apr APR april APRIL")
      Rosetta.localize("%p %P", time)
        .should eq("PM pm")
    end
  end

  describe ".date" do
    it "localizes a date with a time object" do
      Rosetta.date.with(Time.local(2000, 2, 20)).should eq("2000-02-20")
    end

    it "localizes a date with a named tuple" do
      Rosetta.date.with({2000, 2, 20}).should eq("2000-02-20")
    end

    it "localizes a date according to a given predefined format" do
      Rosetta.date(:short).with({2000, 2, 20}).should eq("Feb 20")
    end

    it "localizes a date according to a given formatted string" do
      Rosetta.date("%B %Y").with(Time.local(2000, 2, 20))
        .should eq("February 2000")
    end
  end

  describe ".time" do
    it "localizes time with a time object" do
      Rosetta.time.with(Time.local(1984, 6, 7, 8, 9, 10))
        .should eq("Thu, 07 Jun 1984 08:09:10 +0200")
    end

    it "localizes time according to a given predefined format" do
      Rosetta.time(:long).with(Time.local(1984, 6, 7, 8, 9, 10))
        .should eq("June 07, 1984 08:09")
    end

    it "localizes time according to a given predefined format" do
      Rosetta.time("%Y | %H | %m | %S").with(Time.local(1984, 6, 7, 8, 9, 10))
        .should eq("1984 | 08 | 06 | 10")
    end
  end

  describe ".number" do
    it "localizes a number " do
      Rosetta.number.with(123_456.789).should eq("123,456.79")
    end

    it "localizes a number according to a given predefined format " do
      Rosetta.number(:custom).with(123_456.789).should eq("12 34 56.8")
    end
  end
end
