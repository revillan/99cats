class CatRental < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: %w(PENDING APPROVED DENIED) }
  validate :overlapping_request_validation

  belongs_to :cat

  def overlapping_requests?
    start = self.start_date
    finish = self.end_date
    my_id = self.id || 0

    overlaps = CatRental.find_by_sql(<<-SQL)
      SELECT
        *
      FROM
        cat_rentals
      WHERE
        status = 'APPROVED'
        AND
        ( start_date  BETWEEN '#{start}' AND '#{finish}'
        OR
        end_date BETWEEN '#{start}' AND '#{finish}' )
        AND
        id != #{my_id}
      SQL
    return true unless overlaps.empty?
    false
  end

  private
  def overlapping_request_validation
    if overlapping_requests? && self.status == "APPROVED"
      errors[:status] << "your cat rental overlaps with an existing cat rental for this cat. find another cat, plz"
    end
  end

end
