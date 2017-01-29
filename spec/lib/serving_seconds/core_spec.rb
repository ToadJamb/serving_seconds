# frozen_string_literal: true
RSpec.describe ServingSeconds do
  secs =   1
  mins =  60 * secs
  hrs  =  60 * mins
  days =  24 * hrs
  yrs  = 365 * days

  describe '.humanize' do
    shared_examples 'humanize' do |args, expected|
      context "given the arguments are #{args}" do
        it "returns #{expected.inspect}" do
          expect(subject.humanize(*args)).to eq expected
        end
      end
    end

    it_behaves_like 'humanize', [   0],  '0s'
    it_behaves_like 'humanize', [0.49],  '0s'
    it_behaves_like 'humanize', [0.50],  '1s'
    it_behaves_like 'humanize', [  59], '59s'
    it_behaves_like 'humanize', [  60],  '1m'

    it_behaves_like 'humanize', [1 * hrs - 31], '59m'
    it_behaves_like 'humanize', [1 * hrs - 30],  '1h'

    it_behaves_like 'humanize', [23 * hrs + 29 * mins], '23h'
    it_behaves_like 'humanize', [23 * hrs + 30 * mins], '1d'

    it_behaves_like 'humanize', [6 * days + 11 * hrs], '6d'
    it_behaves_like 'humanize', [6 * days + 12 * hrs], '1w'

    it_behaves_like 'humanize', [364 * days + 23 * hrs + 59 * mins + 59], '52w'
    it_behaves_like 'humanize', [365 * days], '1y'

    it_behaves_like 'humanize', [3650 * days], '10y'
    it_behaves_like 'humanize', [36500 * days], '100y'

    it_behaves_like 'humanize', [   0, 1],  '0.0s'
    it_behaves_like 'humanize', [0.04, 1],  '0.0s'
    it_behaves_like 'humanize', [0.05, 1],  '0.1s'
    it_behaves_like 'humanize', [0.94, 1],  '0.9s'
    it_behaves_like 'humanize', [0.95, 1],  '1.0s'
    it_behaves_like 'humanize', [  59, 1], '59.0s'
    it_behaves_like 'humanize', [  60, 1],  '1.0m'
    it_behaves_like 'humanize', [  62, 1],  '1.0m'
    it_behaves_like 'humanize', [  63, 1],  '1.1m'

    it_behaves_like 'humanize', [1 * hrs - 4, 1], '59.9m'
    it_behaves_like 'humanize', [1 * hrs - 3, 1],  '1.0h'
    it_behaves_like 'humanize', [1 * hrs + 2 * mins, 1],  '1.0h'
    it_behaves_like 'humanize', [1 * hrs + 3 * mins, 1],  '1.1h'

    it_behaves_like 'humanize', [23 * hrs + 56 * mins, 1], '23.9h'
    it_behaves_like 'humanize', [23 * hrs + 57 * mins, 1], '1.0d'
    it_behaves_like 'humanize', [24 * hrs + 1 * hrs, 1], '1.0d'
    it_behaves_like 'humanize', [24 * hrs + 2 * hrs, 1], '1.1d'

    it_behaves_like 'humanize', [6 * days + 22 * hrs, 1], '6.9d'
    it_behaves_like 'humanize', [6 * days + 23 * hrs, 1], '1.0w'

    it_behaves_like 'humanize',
    [364 * days + 23 * hrs + 59 * mins + 59, 1], '52.1w'
    it_behaves_like 'humanize', [365 * days, 1], '1.0y'

    it_behaves_like 'humanize', [3650 * days, 1], '10.0y'
    it_behaves_like 'humanize', [36500 * days, 1], '100.0y'

    it_behaves_like 'humanize', [10 * yrs, :long], '10 years'
    it_behaves_like 'humanize', [10 * yrs + 3 * days, :long], '10 years, 3 days'
    it_behaves_like 'humanize',
      [10 * yrs + 363 * days + 23 * hrs + 59 * mins + 59, :long],
      '10 years, 51 weeks, 6 days, 23 hours, 59 minutes, 59 seconds'
    it_behaves_like 'humanize',
      [1 * yrs + 8 * days + 1 * hrs + 1 * mins + 1, :long],
      '1 year, 1 week, 1 day, 1 hour, 1 minute, 1 second'
  end
end
