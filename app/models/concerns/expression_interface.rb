module ExpressionInterface
  extend ActiveSupport::Concern

  # インターフェース
  # plus()メソッドがオーバーライドされていなければ、メソッド呼び出し時にエラーが投げられる
  def plus(addObject)
    raise NotImplementedError.new("#{self.class}##{__method__}が実装されていません")
  end
end