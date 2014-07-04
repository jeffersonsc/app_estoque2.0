module ApplicationHelper
	def datetime(value)
		value.strftime("%d/%m/%Y - %H:%M")
	end
	def time(value)
		value.strftime("%H:%M")
	end
	def date(value)
		value.strftime("%d/%m/%Y")
	end
	def moeda(value)
		sprintf("R$ %0.2f", value)
	end
	def count_days(value)
		t1 = Time.now.strftime("%Y-%m-%d")
		t2 = value.strftime("%Y-%m-%d")
		t1 = Date.parse(t1)
		t2 = Date.parse(t2)
		date = (t1 - t2 ).to_i
		if date
			return  "Criado há #{pluralize(date, 'dia',"dias")} "
		else
			return  "Criado há #{pluralize(dates, 'minuto',"minutos")} "
		end
	end
end
